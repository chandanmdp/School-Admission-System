class FeesController < ApplicationController
  before_action :logged_in_user
  before_action :admin_user, except:[:index]

  def index
    @sections = Section.all
    @fees = Fee.all
  end

  def new
    @sections = Section.all
    @fee = Fee.new
  end

  def create
    @sections = Section.all
    @fee = Fee.new(fee_params)
    if @fee.save
      flash[:notice] = "Fee added successfully"
      redirect_to fees_path
    else
      render 'new'
    end
  end

  def edit
    @sections = Section.all
    @fee = Fee.find(params[:id])
  end

  def update
    @sections = Section.all
    @fee = Fee.find(params[:id])
    if @fee.update_attributes(fee_params)
      flash[:notice] = "Fee updated successfully"
      redirect_to fees_path
    else
      render 'edit'
    end
  end

  def destroy
    @fee = Fee.find(params[:id])
    @fee.destroy
    flash[:notice] = "Fee destroyed successfully"
    redirect_to fees_path

  end

  private

  def fee_params
    params.require(:fee).permit(:section_id, :fee_amount, :fee_name)
  end

  def admin_user
    unless current_user.admin?
      redirect_to(root_path)
      flash[:danger]="You are not authorized to perform this action"
    end
  end

end
