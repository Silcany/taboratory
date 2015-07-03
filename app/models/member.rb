require 'open-uri'
require 'nokogiri'

class Member < ActiveRecord::Base
  belongs_to :exam_group
  has_many :thinks

  def self.order_by_score
    member_ids = Hash.new(0)
    Think.group(:member_id, :good).count(:member_id, :good).each do |member_id_good, count|
      if member_id_good.last
        member_ids[member_id_good.first] += count
      else
        member_ids[member_id_good.first] -= count
      end
    end

    member_ids.sort_by{|_, score| score}.map(&:first)
  end

  def score
    thinks.where(good: true).count - thinks.where(good: false).count
  end

  def homepage_url
    return url if url

    url = Member.get_google_top_url(name + ' 東工大')

    if url
      update_attribute(:url, url)
      url
    else
      nil
    end
  end

  def self.get_google_top_url(str)
    return '-' if str == nil
    query = CGI.escape(str)

    url = 'http://www.google.co.jp/search?q=' + query + '&lr=lang_ja&ie=utf-8&oe=utf-8'
    data = open(url).read
    doc = Nokogiri::HTML.parse(data)
    url = doc.css('cite').first.inner_text

    if url
      url = 'http://' + url unless url.include? 'http'
      url
    else
      nil
    end
  end
end
