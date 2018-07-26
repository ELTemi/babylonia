module ApplicationHelper

  def logged_in_as_mom?
    @user = User.find(session[:user_id])
    @mom = Mom.find_by(email: @user.email)
    !@mom.blank?
  end

  def logged_in_as_caregiver?
    @user = User.find(session[:user_id])
    @caregiver = Caregiver.find_by(email: @user.email)
    !@caregiver.blank?
  end
end
