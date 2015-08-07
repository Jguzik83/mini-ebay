class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @user = User.find_by(id: session[:user_id])
    item = Item.new(item_params)
    item.user = @user
    if item.save
      redirect_to user_path(@user.id)
    else
      redirect_to new_user_item_path(@user.id)
    end
  end

  def edit
    @item = Item.find_by(id: params[:id])
    @user = User.find_by(id: session[:user_id])
  end

  def update
    item = Item.find_by(id: params[:id])
    user = User.find_by(id: session[:user_id])
    item.update(item_params)
    redirect_to user_path(user.id)
  end

  def show
    @item = Item.find_by(id: params[:id])
    @user = User.find_by(id: session[:user_id])
  end

  def destroy
    user = User.find_by(id: session[:user_id])
    item = Item.find_by(id: params[:id])
    item.destroy
    redirect_to user_path(user.id)
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :start, :end, :user_id)
  end

end
