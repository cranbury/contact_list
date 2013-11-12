class UsersController < ApplicationController
  def index
    render text: "I'm in the index action!"

  end

  def create
    user = User.new(params[:user])
    if user.save
      render :json => user
    else
      render :json => user.errors, :status => :unprocessable_entity
    end
  end

  def show
    render text: User.find_by_id(params[:id]).show_name
  end

  def update
    user = User.find_by_id(params[:id])
    user.attributes = params[:user]
    if user.save
      render :json => user
    else
      render :json => user.errors, :status => :unprocessable_entity
    end
  end

  def destroy
    render :json => User.find_by_id(params[:id]).destroy
  end

end
