class IndexController < ApplicationController
  def index
    @voice = Voice.new
    @members = ExamGroup.find_by_name('計算工学').members
  end
end
