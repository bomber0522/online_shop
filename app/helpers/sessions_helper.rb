module SessionsHelper

  def log_in(member)
    session[:member_id] = member.id
  end

  def current_member
    if session[:member_id]
      @current_member ||= Member.find_by(id: member_id)
    end
  end

  def logged_in?
    !current_member.nil?
  end

  def log_out
    session.delete(:member_id)
    @current_member = nil
  end
end