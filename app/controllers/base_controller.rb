class BaseController < ApplicationController
  before_filter :require_login

  private

  def require_login
    unless current_user
      redirect_to root_url
    end
  end
end
