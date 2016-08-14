class RequestsController < ApplicationController
before_action :admin_user,     only: [:destroy, :index]

  def new
  	@request=Request.new
    if !logged_in?
      flash[:danger]="Please login to access our services"
      redirect_to root_url
    end
  end

  def show
    @request = Request.find(params[:id])
    if !check_email(@request.email)
        flash[:danger] = "Entered email id does not match your login email id."
        redirect_to root_url
    end
  end

  def create
  	@request = Request.new(request_params)
  if logged_in? && check_email(@request.email)
  	if @request.save
      flash[:success] = "Your request have been successfully received. You will be contacted shortly."
      redirect_to @request
    else
    	render 'new'
    end
  else
      if !check_email(@request.email)
        flash[:danger] = "Entered email id does not match your login email id."
      else    
        flash[:danger] = "Please log in to continue."
      end
      render 'new'
  end
  end 

  def index
    @requests = Request.paginate(page: params[:page]).order(created_at: :desc)
  end

  def destroy
    Request.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to requests_url
  end

  private

    def request_params
      params.require(:request).permit(:email, :request_type, :phone,
                                   :day, :time)
    end

    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

end
