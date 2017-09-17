class SectionsController < ApplicationController
    before_action :logged_in_user, except: [:index , :show]
    before_action :admin_user, except: [:index, :show]
  def index
    @sections = Section.all
  end

  def show
    @section = Section.find(params[:id])
    if logged_in?
    if current_user.admin?
      @candidates=@section.candidates
    else
      @candidates= @section.candidates.where("user_id=#{current_user.id}")
    end
  end
  end

  def new
    @section = Section.new
  end

  def create
    @section = Section.new(section_params)
    if @section.save
      flash[:notice] = "Section created successfully"
      redirect_to(sections_path)
    else
      render ('new')
    end
  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
      flash[:notice] = "Section updated successfully"
      redirect_to(sections_path(@section))
    else
      render('edit')
    end
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    flash[:notice] = "Section destroyed successfully"
    redirect_to sections_path
  end


  private

  def section_params
    params.require(:section).permit(:section_name, :section_grades)
  end

  def admin_user
    unless current_user.admin?
      redirect_to(sections_path)
      flash[:notice]="You are not authorized to perform this action"
    end
  end

end
