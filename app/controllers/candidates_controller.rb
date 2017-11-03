class CandidatesController < ApplicationController
  before_action :logged_in_user
  before_action :admin_user, only:[:manage, :destroy]
  before_action :find_section_and_candidate , only:[:show, :edit, :update, :destroy, :manage]
  after_action :save_my_previous_url, only: [:edit]

  def index

    if current_user.admin?
      @candidates = Candidate.all
      @under_process_candidates = Candidate.where('admission_status="Under Process" or admission_status="Accepted" ')
      @selected_candidates = Candidate.where('admission_status="Selected"')
      @rejected_candidates = Candidate.where('admission_status="Rejected"')
    else
      @candidates = current_user.candidates
      @under_process_candidates = current_user.candidates.where('admission_status="Under Process" or admission_status="Accepted" ')
      @selected_candidates = current_user.candidates.where('admission_status="Selected"')
      @rejected_candidates = current_user.candidates.where('admission_status="Rejected"')
    end
  end

  def show
    @user = @candidate.user
    correct_user_or_admin
  end

  def select
    @sections = Section.all
  end

  def build
    @section = Section.find(params[:section])
    redirect_to new_section_candidate_path(@section)
  end

  def new
    @section = Section.find(params[:section_id])
    @candidate =@section.candidates.new
  end

  def create
    @section = Section.find(params[:section_id])
    @candidate = @section.candidates.new(candidate_params)
    @candidate.user_id = current_user.id
    @user = User.find_by_id(@candidate.user_id)

    if @candidate.save
      UserMailer.welcome_email(@user, @candidate).deliver_later
      flash[:notice] = "Candidate created successfully"
      redirect_to section_path(@section)
    else
      render('new')
    end
  end

  def edit
    correct_user_or_admin
  end

  def update
    @back = session[:my_previous_url]
    correct_user_or_admin
    @user = User.find_by_id(@candidate.user_id)
    if @candidate.update_attributes(candidate_params)

      if params[:candidate][:admission_status].present?
        if @candidate.admission_status == "Accepted"
          redirect_to new_section_candidate_appointment_path(@candidate.section, @candidate)
        elsif @candidate.admission_status == "Rejected"
          UserMailer.rejection_email(@user, @candidate).deliver_later
          flash[:notice] = "Candidate updated successfully"
          redirect_to(candidates_index_path)
        elsif @candidate.admission_status == "Selected"
          UserMailer.selection_email(@user, @candidate).deliver_later
          flash[:notice] = "Candidate updated successfully"
          redirect_to(candidates_index_path)
        end
      else
        flash[:notice] = "Candidate updated successfully"
        redirect_to @back
      end
    elsif params[:candidate][:admission_status].present?
      render ('manage')
    else
      render('edit')
    end
  end

  def destroy
    @candidate.destroy
    flash[:notice] = "Candidate destroyed successfully"
    redirect_to request.referer
  end

  def manage
  end

  private

  def candidate_params
    params.require(:candidate).permit(:name, :father_name, :mother_name, :education, :contact_address,
     :parent_contact_number, :alternate_parent_contact_number, :image, :marksheet, :admission_status,
      :rejection_reason, :grade)
  end

  def correct_user_or_admin
    unless @candidate.user_id == current_user.id || current_user.admin?
      redirect_to section_path(@section) and return
      flash[:danger]="You are not authorized"
    end
  end

  def admin_user
    unless current_user.admin?
      redirect_to(root_path)
      flash[:danger]="You are not authorized to perform this action"
    end
  end

  def find_section_and_candidate
    @section = Section.find(params[:section_id])
    @candidate = @section.candidates.find(params[:id])
  end

  def save_my_previous_url
    # session[:previous_url] is a Rails built-in variable to save last url.
    session[:my_previous_url] = URI(request.referer || '').path
  end

end
