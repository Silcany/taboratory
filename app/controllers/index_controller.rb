class IndexController < ApplicationController
  def index
    @voice = Voice.new
    @members = ExamGroup.where(name: ["計算工学", "通信情報工学", "知能システム科学"]).map(&:members).flatten.sample(9)
    @groups = ExamGroup.joins(:members).group('exam_groups.id')
  end
end
