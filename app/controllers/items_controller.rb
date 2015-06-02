class ItemsController < ApplicationController
  before_filter :load_pack
  def index
    @items = @pack.items
  end

  def create
    @item = @pack.items.new item_params
    if @item.save
      redirect_to "/packs/#{@pack.id}/items"
    else
      redirect_to "/packs/#{@pack.id}/items", :notice => "Can't create item: " + @item.errors.messages.values.join(" ")
    end
  end

  private

  def load_pack
    @pack = current_user.packs.find params[:pack_id]
  end

  def item_params
    params.require(:item).permit(:content, :weight)
  end
end
