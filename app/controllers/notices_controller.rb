class NoticesController < ApplicationController
  before_action :logged_in_user, except:[:index, :show]
  before_action :admin_user, except:[:index, :show]

  def index
    @notices = Notice.all
  end

  def new
    @notice = Notice.new
  end

  def show
    @notice = Notice.find(params[:id])
  end

  def create
    @notice = Notice.new(notice_params)

    if @notice.save
      flash[:notice] = "Notice created successfully"
      redirect_to(notices_path)
    else
      render ('new')
    end
  end

  def edit
    @notice = Notice.find(params[:id])
  end

  def update
    @notice = Notice.find(params[:id])

    if @notice.update_attributes(notice_params)
      flash[:notice] = "Notice updated successfully"
      redirect_to(notices_path)
    else
      render('edit')
    end
  end

  def destroy
    @notice = Notice.find(params[:id])

    if Time.now > @notice.created_at + 1.month
      @notice.destroy
      flash[:notice] = "Notice destroyed successfully"
        redirect_to notices_path
    else
      flash[:notice] = "Retry deleting later"
      redirect_to notices_path
    end
  end

  private

  def notice_params
    params.require(:notice).permit(:notice_title, :content)
  end

  def admin_user
    unless current_user.admin?
      redirect_to(notices_path)
      flash[:notice]="You are not authorized to perform this action"
    end
  end

end
