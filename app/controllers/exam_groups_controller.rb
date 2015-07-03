class ExamGroupsController < ApplicationController
  def show
    @group = ExamGroup.find(params[:id])
  end
end
