class AppointmentsController < ApplicationController
  before_action :logged_in_user
  before_action :admin_user, except:[:show]
  before_action :correct_user_or_admin, only:[:show]
  before_action :find_section_and_candidate, only:[:new, :show, :create]

  def index
    @appointments = Appointment.order('datetime ASC')
  end

  def new
    @appointment = Appointment.new
  end

  def show
  end

  def create
    @user = User.find(@candidate.user_id)
    @appointment = Appointment.new(datetime_params)
    @appointment.candidate_id = params[:candidate_id]

    if @appointment.save
      UserMailer.appointment_details(@user, @candidate).deliver_later
      flash[:notice] = "Appointment created successfully"
      redirect_to appointments_index_path
    else
      render'new'
    end
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    if @appointment.datetime > Time.now
      flash[:danger]="You can destroy this appointment once it's over"
      redirect_to appointments_index_path
    elsif @appointment.candidate.admission_status == "Accepted"
      flash[:danger]="Manage candidate's admission before destroying appointment"
      redirect_to appointments_index_path
    else
      @appointment.destroy
      redirect_to appointments_index_path
    end
  end

  private

  def datetime_params
    params.require(:appointment).permit(:datetime, :venue)
  end

  def admin_user
    unless current_user.admin?
      redirect_to(root_path)
      flash[:danger]="You are not authorized to perform this action"
    end
  end

  def correct_user_or_admin
    unless current_user.admin? || current_user?(User.find(Candidate.find(params[:candidate_id]).user_id))
      redirect_to(root_path)
      flash[:danger]="You are not authorized to perform this action"
    end
  end

  def find_section_and_candidate
    @section = Section.find(params[:section_id])
    @candidate = @section.candidates.find(params[:candidate_id])
  end

end
