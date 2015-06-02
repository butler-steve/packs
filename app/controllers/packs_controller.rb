class PacksController < BaseController
  before_filter :require_login

  def new
    @pack = Pack.new
  end

  def create
    @pack = current_user.packs.new pack_params
    if @pack.save
      redirect_to root_url, :notice => "Pack '#{@pack.name}' was created."
    else
      redirect_to new_pack_path, :notice => "Can't create the pack: " + @pack.errors.messages.values.join(" ")
    end
  end

  def update
  end

  def destroy
  end

  def index
    @packs = current_user.packs

    respond_to do |format|
      format.html
      format.json { render json: @packs }
    end
  end

  def show
  end

  private

  def pack_params
    params.require(:pack).permit(:name, :expiration_interval, :sched_algo)
  end
end
