class IndexController < ApplicationController
  def index
    @voice = Voice.new
    all_members_ids = Member.order_by_score
    members_ids = all_members_ids.first(3) + all_members_ids.reverse.first(3) +
      Member.where(exam_group_id: ExamGroup.where(name: ["計算工学", "通信情報工学", "知能システム科学"]).pluck(:id)).order('RAND()').limit(3).pluck(:id)
    @members = Member.includes(:thinks).where(id: members_ids.uniq)

    @groups = Member.group(:exam_group_id).count
    @groups = ExamGroup.find_by_sql([
      'SELECT exam_groups.*, COUNT(exam_groups.id) AS members_count FROM exam_groups
       JOIN members on exam_groups.id = members.exam_group_id
       GROUP BY exam_groups.id
       ORDER BY exam_groups.id'])
  end
end
