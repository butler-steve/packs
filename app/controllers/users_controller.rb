class UsersController < BaseController
  skip_before_filter :require_login, :only => [:new, :create]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url, :notice => "Account successfully created."
    else
      flash.now.alert = "Can't create the account: " + @user.errors.messages.values.join(" ")
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
