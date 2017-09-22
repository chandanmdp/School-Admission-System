class AppointmentsController < ApplicationController
  before_action :logged_in_user
  before_action :admin_user

  def index
    @appointments = Appointment.all
  end

  def new
    @appointment = Appointment.new
    @user = User.find(params[:user_id])
    @candidate = @user.candidate

    if @candidate.present?
      @section = @candidate.section
    else
      flash[:danger] = "Must have one Candidate"
      redirect_to root_path
    end
  end

  def create
    @user = User.find(params[:user_id])
    @candidate = @user.candidate
    @section = @candidate.section
    @appointment = Appointment.new(datetime_params)
    @appointment.user_id = params[:user_id]

    if @appointment.save
      flash[:notice] = "appointment created successfully"
      redirect_to section_candidate_path(@section, @candidate)
    else
      render'new'
    end
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    redirect_to appointments_index_path
  end

  private

  def datetime_params
    params.require(:appointment).permit(:datetime)
  end

  def admin_user
    unless current_user.admin?
      redirect_to(root_path)
      flash[:notice]="You are not authorized to perform this action"
    end
  end
  
end
