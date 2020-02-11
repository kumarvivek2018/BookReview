class SessionsController < ApplicationController
  def new
    @reviewer = Reviewer.new
    render 'login'
  end

  def create
    reviewer = Reviewer.find_by(username: params[:reviewer][:username].downcase)

    if(reviewer && reviewer.authenticate(params[:reviewer][:password]))
      session[:reviewer_id] = reviewer.id
      redirect_to books_path, notice: "Logged-in successfully"
    else
      redirect_to login_path, alert: "Invalid username/password combination"
    end
  end

  def destroy
    reset_session
    redirect_to login_path, notice: "Logged-out successfully"
  end
end
