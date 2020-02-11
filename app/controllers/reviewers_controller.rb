class ReviewersController < ApplicationController
  skip_before_action :ensure_login, only: [:new, :create]

  def index
    redirect_to signup_path
  end

  def new
    redirect_to books_path and return if logged_in?

    @reviewer = Reviewer.new
    render 'signup'
  end

  def create
    params[:reviewer][:username].downcase!

    @reviewer = Reviewer.new(reviewer_params)

    if(@reviewer.save)
      session[:reviewer_id] = @reviewer.id
      redirect_to books_path, notice: "Account created, logged-in successfully"
    else
      flash[:alert] = "Unable to create an account"
      render 'signup'
    end
  end

  private
    def reviewer_params
      params.fetch(:reviewer, {}).permit(:name, :username, :password)
    end
end
