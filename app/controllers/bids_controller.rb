class BidsController < ApplicationController

  def new

    @bid = Bid.new
    @item = Item.find_by(id: params[:item_id])
    @user = User.find_by(id: session[:user_id])
  end

  def create
    p params
    @item = Item.find_by(id: params[:item_id])
    bid = Bid.new(bid_params)
    bid.item = @item
    if bid.save
      redirect_to user_path(@item.user_id)
    else
      redirect_to root_path
    end
  end

  private

  def bid_params
    params.require(:bid).permit(:amount, :item_id, :user_id)
  end
end
