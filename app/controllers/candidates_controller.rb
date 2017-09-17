class CandidatesController < ApplicationController
  before_action :logged_in_user
  before_action :admin_user, only: [:manage]
  
  def index
    if current_user.admin?
    @candidates= Candidate.sorted
    else
    @candidates= Candidate.sorted.where("user_id=#{current_user.id}")
    end
  end

  def show
    @section = Section.find(params[:section_id])
    @candidate = @section.candidates.find(params[:id])
    correct_user
  end

  def new
    @section = Section.find(params[:section_id])
    @candidate = @section.candidates.new
  end

  def create
    @section = Section.find(params[:section_id])
    @candidate = @section.candidates.new(candidate_params)
    @candidate.user_id = current_user.id
    if @candidate.save
      flash[:notice] = "Candidate created successfully"
      redirect_to section_path(@section)
    else
      render('new')
    end
  end

  def edit
    @section = Section.find(params[:section_id])
    @candidate = @section.candidates.find(params[:id])
    correct_user
  end

  def update
    @section = Section.find(params[:section_id])
    @candidate = @section.candidates.find(params[:id])
    correct_user
    if @candidate.update_attributes(candidate_params)
      flash[:notice] = "Candidate updated successfully"
      redirect_to(section_path(@section))
    elsif @candidate.admission_status.present?
      render ('manage')
    else
      render('edit')
    end
  end

  def destroy
    @section = Section.find(params[:section_id])
    @candidate = @section.candidates.find(params[:id])
        @candidate.destroy
        flash[:notice] = "Candidate destroyed successfully"
        redirect_to section_path(@section)
  end

  def manage
    @section = Section.find(params[:section_id])
    @candidate = @section.candidates.find(params[:id])
  end

  private

  def candidate_params
    params.require(:candidate).permit(:name, :father_name, :mother_name, :education, :contact_address,
     :parent_contact_number, :alternate_parent_contact_number, :image, :marksheet, :admission_status, :rejection_reason)
  end

  def correct_user
    unless @candidate.user_id == current_user.id
      redirect_to section_path(@section)
      flash[:notice]="You are not authorized"
    end
  end

  def admin_user
    unless current_user.admin?
      redirect_to(root_path)
      flash[:notice]="You are not authorized to perform this action"
    end
  end

end
