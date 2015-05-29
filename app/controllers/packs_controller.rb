class PacksController < ApplicationController
  before_filter :require_login

  def new
    @pack = Pack.new
  end

  def create
    @pack = Pack.new pack_params
    if @pack.save
      redirect_to root_url, :notice => "Pack '#{@pack.name}' was created."
    end
  end

  def update
  end

  def destroy
  end

  def index
    @packs = current_user.packs
  end

  def show
  end

  private

  def pack_params
    params.require(:pack).permit(:name, :expiration_interval, :sched_algo)
  end
end
