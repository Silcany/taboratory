require 'open-uri'
require 'nokogiri'

class Member < ActiveRecord::Base
  belongs_to :exam_group
  has_many :thinks

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
