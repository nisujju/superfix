class RequestsController < ApplicationController
before_action :admin_user,     only: [:destroy, :index]
#before_action :assign_email,   only: [:create]
  def new
  	@request=Request.new
    if !logged_in?
      flash[:danger]="Please login to access our services"
      redirect_to root_url
    end
  end

  def show
    @request = Request.find(params[:id])
    if @request.email != current_user.email
      flash[:danger] = "No Request Found"
      redirect_to root_url
    end
  end

  def create
  	@request = Request.new(request_params)
    assign_email
  if logged_in?
  	if @request.save
      redirect_to @request
    else
    	render 'new'
    end
  else
    flash[:danger] = "Please log in to continue."
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
      params.require(:request).permit(:name, :request_type, :phone,
                                   :day, :time, :email)
    end

    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

    def assign_email
      @request.email = current_user.email
    end
end
