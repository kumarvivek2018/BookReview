class SessionsController < ApplicationController
  def index
    redirect_to login_path
  end

  def new
    @reviewer = Reviewer.new
    render 'login'
  end

  def create
    @reviewer = Reviewer.find_by(username: params[:reviewer][:username].downcase)

    if(@reviewer && @reviewer.authenticate(params[:reviewer][:password]))
      session[:reviewer_id] = @reviewer.id
      redirect_to books_path, notice: "Logged-in successfully"
    else
      @reviewer = Reviewer.new(reviewer_params) if @reviewer.nil?
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
