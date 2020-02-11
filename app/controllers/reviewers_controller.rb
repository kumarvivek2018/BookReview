class ReviewersController < ApplicationController
  def new
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
      render 'signup', alert: "Unable to create an account"
    end
  end

  private
    def reviewer_params
      params.fetch(:reviewer, {}).permit(:name, :username, :password)
    end

    def get_signup
      @reviewer = Reviewer.new
      render 'signup'
    end
end
