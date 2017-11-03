class UsersController < ApplicationController
  before_action :logged_in_user, only:[:index, :show, :edit, :update]
  before_action :correct_user_or_admin, only:[:edit, :update, :show]
  before_action :already_logged_in, only:[:new, :create]

  def index
    if current_user.admin?
      @users = User.paginate(page: params[:page], :per_page => 5)
    else
      flash[:notice] = "You are not authorized"
      redirect_to root_path
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:notice] = "Welcome"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:notice] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.admin
      flash[:danger] = "Sorry, Admin can't be deleted."
      redirect_to users_path
    else
      @user.destroy
      flash[:notice] = "User deleted"
      redirect_to users_path
    end
  end


  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def correct_user_or_admin
      @user = User.find(params[:id])
      unless current_user?(@user) || current_user.admin?
        redirect_to(root_url)
        flash[:danger]="You are not authorized to perform this action"
      end
    end

    def already_logged_in
      if current_user.present?
        flash[:notice] = "You are already logged in"
        redirect_to root_path
      end
    end

end
