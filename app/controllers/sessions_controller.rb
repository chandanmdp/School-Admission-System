class SessionsController < ApplicationController
  before_action :already_logged_in , only:[:new, :create]

  def new
  end

  def create
    if params[:session][:email].present? && params[:session][:password].present?
      user = User.find_by(email: params[:session][:email].downcase)
      if user
        authorized_user = user.authenticate(params[:session][:password])
      end
    end

    if authorized_user
      flash[:notice] = 'You are now logged in'
      log_in authorized_user
      redirect_back_or root_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    flash[:notice] = "You are logged out"
    redirect_to root_path
  end

  def already_logged_in
    if current_user.present?
      flash[:notice] = "You are already logged in"
      redirect_to root_path
    end
  end

end
