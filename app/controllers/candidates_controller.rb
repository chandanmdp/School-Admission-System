class CandidatesController < ApplicationController


  def index
  end

  def show
    @section = Section.find(params[:section_id])
    @candidate = @section.candidates.find(params[:id])
  end

  def new
    @section = Section.find(params[:section_id])
    @candidate = @section.candidates.new
  end

  def create
    @section = Section.find(params[:section_id])
    @candidate = @section.candidates.new(candidate_params)
    if @candidate.save
      redirect_to section_path(@section)
    else
      render('new')
    end
  end

  def edit
    @section = Section.find(params[:section_id])
    @candidate = @section.candidates.find(params[:id])
  end

  def update
    @section = Section.find(params[:section_id])
    @candidate = @section.candidates.find(params[:id])
    if @candidate.update_attributes(candidate_params)
      redirect_to(section_path(@section))
    else
      render ('edit')
    end
  end

  def destroy
    @section = Section.find(params[:section_id])
    @candidate = @section.candidates.find(params[:id])
        @candidate.destroy
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
end
