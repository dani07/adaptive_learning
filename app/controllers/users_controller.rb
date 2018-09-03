class UsersController < ApplicationController
  include AuthorizeUser
  include UserService

# Used to get the user’s percentage of correct answers, wrong answers and unseen questions within a chapter, within a topic, within a subject and within an exam
  def summary
    user_id = params[:user_id] || current_user.try(:id)
    summary = UserService.get_summary user_id
    render json: summary
  end

end
