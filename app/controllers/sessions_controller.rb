class SessionsController < BaseController
  skip_before_filter :require_login

  def new
  end

  def create
    user = login(params[:email], params[:password], params[:remember_me])
    if user
      redirect_to packs_path(user)
    else
      flash.now.alert = "Login information is not valid."
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_url, :notice => "Logged out"
  end
end
