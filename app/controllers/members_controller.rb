class MembersController < ApplicationController
  def index
    @members = Member.all
  end

  def show
    @member = Member.find(params[:id])
  end

  def edit
    
  end

  def create
    
  end

  def update
    
  end

  def destroy
    
  end
end
