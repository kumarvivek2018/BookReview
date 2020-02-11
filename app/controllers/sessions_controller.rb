class SessionsController < ApplicationController
  skip_before_action :ensure_login, only: [:new, :create]

  def index
    redirect_to login_path
  end

  def new
    redirect_to books_path and return if logged_in?
    
    @reviewer = Reviewer.new
    render 'login'
  end

  def create
    @reviewer = Reviewer.find_by(username: params[:reviewer][:username].downcase)

    if(@reviewer.present? && @reviewer.authenticate(params[:reviewer][:password]))
      session[:reviewer_id] = @reviewer.id
      redirect_to books_path, notice: "Logged-in successfully"
    else
      @reviewer = Reviewer.new(reviewer_params)
      flash[:alert] = "Invalid username/password combination"
      render 'login'
    end
  end

  def destroy
    reset_session
    redirect_to login_path, notice: "Logged-out successfully"
  end

  private
    def reviewer_params
      params.fetch(:reviewer, {}).permit(:username, :password)
    end
end
