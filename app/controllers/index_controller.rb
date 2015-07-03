class IndexController < ApplicationController
  def index
    @voice = Voice.new
    @members = ExamGroup.where(name: ["計算工学", "通信情報工学", "知能システム科学"]).map(&:members).flatten.sample(9)
    @groups = Member.group(:exam_group_id).count
    @groups = ExamGroup.find_by_sql([
      'SELECT exam_groups.*, COUNT(exam_groups.id) AS members_count FROM exam_groups
       JOIN members on exam_groups.id = members.exam_group_id
       GROUP BY exam_groups.id'])
  end
end
