class PaymentsController < ApplicationController
  before_action :logged_in_user
  before_action :admin_user , only:[:update]
  before_action :correct_user_or_admin, only:[:show]
  before_action :find_user

  def index
    if current_user.admin?
      @payments = Payment.all
    elsif current_user?(@user)
      @payments = Payment.where("user_id = #{current_user.id}")
    else
      flash[:danger]="You are not authorized to perform this action"
      redirect_to root_path
    end
  end

  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params)
    @payment.user_id = @user.id
    if @payment.save
      flash[:notice] = "Payment Receipt Successfully uploaded"
      redirect_to user_payments_path
    else
      render 'new'
    end
  end

  def show
      @payment = Payment.find(params[:id])
  end

  def update
    @payment = Payment.find(params[:id])
    if @payment.update_attributes(payment_params)
      flash[:notice] = "Payment status updated"
      redirect_to user_payments_path
    else
      flash[:danger] = "Payment status not updated"
      render 'show'
    end
  end

  def destroy
    @payment = Payment.find(params[:id])
    @payment.destroy
    redirect_to user_payments_path
  end

  private

  def payment_params
    params.require(:payment).permit(:payment_name, :payment_image, :payment_status)
  end

  def admin_user
    unless current_user.admin?
      redirect_to(root_path)
      flash[:notice]="You are not authorized to perform this action"
    end
  end

  def correct_user_or_admin
    unless current_user.admin? || current_user?(User.find(params[:user_id]))
      redirect_to(root_path)
      flash[:notice]="You are not authorized to perform this action"
    end
  end

  def find_user
    @user = User.find(params[:user_id])
  end
end
