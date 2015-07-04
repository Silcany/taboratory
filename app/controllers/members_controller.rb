class MembersController < ApplicationController
  def show
    @member = Member.includes(:to_member_comments).find(params[:id])
    @think = Think.find_by_user_id_and_member_id(@current_user.id, params[:id])
    @to_member_comment = ToMemberComment.new

    good_count = @member.thinks.where(good: true).count
    all_count = @member.thinks.count
    if good_count == 0
      if all_count == 0
        @good_percent = 50
      else
        @good_percent = 0
      end
    else
      @good_percent = (good_count * 100.0 / all_count).to_i
    end
  end

  def good
    unless Think.find_by_user_id_and_member_id(@current_user.id, params[:id])
      Think.create(user_id: @current_user.id, member_id: params[:id], good: true)
    end

    redirect_to action: 'show'
  end

  def bad
    unless Think.find_by_user_id_and_member_id(@current_user.id, params[:id])
      Think.create(user_id: @current_user.id, member_id: params[:id], good: false)
    end

    redirect_to action: 'show'
  end

  def comment
    think = Think.find_by_user_id_and_member_id(@current_user.id, params[:id])
    ToMemberComment.create(member_id: params[:id], t: params[:to_member_comment][:t], good: think.good)
    redirect_to action: 'show'
  end
end
