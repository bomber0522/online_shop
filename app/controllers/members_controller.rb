class MembersController < ApplicationController
  def index
    @members = Member.all
  end

  def show
    @member = Member.find(params[:id])
  end

  def new
    
  end

  def create
    @member = Member.new
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    
  end

  def destroy
    
  end
end