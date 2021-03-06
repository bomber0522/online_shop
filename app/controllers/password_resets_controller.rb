
class PasswordResetsController < ApplicationController
  before_action :get_member, only: [:edit, :update]
  before_action :valid_member, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]

  def new
  end

  def create
    @member = Member.find_by(email: params[:password_reset][:email].downcase)
    if @member
      @member.create_reset_digest
      @member.send_password_reset_email
      flash[:info] = "Email sent with passoword reset instructions"
      redirect_to :root
    else
      flash.now[:danger] = "Email address not found"
      render 'new'
    end
  end

  def edit
  end

  def update
    if params[:member][:password].empty?
      @member.errors.add(:password, :blank)
      render 'edit'
    elsif @member.update_attributes(member_params)
      log_in @member
      flash[:success] = "Password has been reset."
      redirect_to @member
    else
      render 'edit'
    end
  end

  private

    def member_params
      params.require(:member).permit(:password, :password_confirmation)
    end

  def get_member
    @member = Member.find_by(email: params[:email])
  end

  def valid_member
    unless (@member && @member.activated? &&
          @member.authenticated?(:reset, params[:id]))
      redirect_to :root
    end
  end

  def check_expiration
    if @member.password_reset_expired?
      redirect_to :new_password_reset, notice: "Password reset has expired."
    end
  end
end
