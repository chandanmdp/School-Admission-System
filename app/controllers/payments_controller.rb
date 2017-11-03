class PaymentsController < ApplicationController
  before_action :logged_in_user
  before_action :admin_user, only:[:update]
  before_action :correct_user_or_admin, only:[:show, :new, :create, :destroy]
  before_action :find_candidate_and_user, only:[:new, :create, :update]

  def index
    if current_user.admin?
      @sections = Section.all
    else
      @candidate = Candidate.find(params[:candidate_id])
    end
  end

  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params)
    @payment.candidate_id = params[:candidate_id]

    if @payment.save
      flash[:notice] = "Payment Receipt Successfully uploaded"
      redirect_to payments_index_path
    else
      render 'new'
    end
  end

  def show
    @payment = Payment.find(params[:id])
    @candidate = Candidate.find(params[:candidate_id])
  end

  def update
    @payment = Payment.find(params[:id])
    if @payment.update_attributes(payment_params)
      flash[:notice] = "Payment status updated"
      redirect_to section_candidate_payments_path
    else
      flash[:danger] = "Payment status not updated"
      render 'show'
    end
  end

  def destroy
    @payment = Payment.find(params[:id])
    @payment.destroy
    redirect_to section_candidate_payments_path
  end

  private

  def payment_params
    params.require(:payment).permit(:payment_name, :payment_image, :payment_status, :payment_mode, :amount)
  end

  def admin_user
    unless current_user.admin?
      redirect_to(root_path)
      flash[:notice]="You are not authorized to perform this action"
    end
  end

  def correct_user_or_admin
    unless current_user.admin? || current_user?(User.find(Candidate.find(params[:candidate_id]).user_id))
      redirect_to(root_path)
      flash[:danger]="You are not authorized to perform this action"
    end
  end

  def find_candidate_and_user
    @candidate = Candidate.find(params[:candidate_id])
    @user = User.find(@candidate.user_id)
  end

end
