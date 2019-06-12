class AccountActivationsController < ApplicationController

  def edit
    member = Member.find_by(email: params[:email])
    if member && !member.activated? && member.authentcated?(:activation, params[:id])
      member.activate
      log_in member
      flash[:succedd] = "Account activated!"
      redirect_to member
    else
      flash[:danger] = "Invalid activation link"
      redirect_to :root
    end
  end
end
