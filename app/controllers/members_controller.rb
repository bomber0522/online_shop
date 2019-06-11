class MembersController < ApplicationController
  def index
    @members = Member.all
  end

  def show
    @member = Member.find(params[:id])
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      @member.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to :root
    else
      render "new"
    end
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    if @member.update_attributes(member_paras)
      flash[:success] = "Profile updated"
      redirect_to @member
    else
      render 'edit'
    end
  end

  def destroy
    Member.find(params[:id]).destroy
    flash[:success] = "Member deleted"
    redirect_to :members
  end

  private

  def member_params
    params.require(:member).permit(:new_profile_picture, :remove_profile_picture,
                    :name, :email, :password, :password_confirmation, :profile)
  end
end
