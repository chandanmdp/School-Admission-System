class EligibilitiesController < ApplicationController
    before_action :logged_in_user, except:[:index]
    before_action :admin_user, except:[:index]

  def index
    @eligibilities = Eligibility.all
  end

  def new
    @eligibility = Eligibility.new
  end

  def create
    @eligibility = Eligibility.new(eligibility_params)

    if @eligibility.save
      flash[:notice] = "Eligibility created successfully"
      redirect_to(eligibilities_path)
    else
      render ('new')
    end
  end

  def edit
    @eligibility = Eligibility.find(params[:id])
  end

  def update
    @eligibility = Eligibility.find(params[:id])

    if @eligibility.update_attributes(eligibility_params)
      flash[:notice] = "Eligibility updated successfully"
      redirect_to(eligibilities_path)
    else
      render('edit')
    end
  end

  def destroy
    @eligibility = Eligibility.find(params[:id])
    @eligibility.destroy
    flash[:notice] = "Eligibility destroyed successfully"
    redirect_to eligibilities_path
  end

  private

  def eligibility_params
    params.require(:eligibility).permit(:title, :criteria)
  end

  def admin_user
    unless current_user.admin?
      redirect_to(eligibilities_path)
      flash[:notice] = "You are not authorized to perform this action"
    end
  end

end
