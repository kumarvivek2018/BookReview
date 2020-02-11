class SessionsController < ApplicationController
  def new
    @reviewer = Reviewer.new
    render 'login'
  end

  def create
  end

  def destroy
  end
end
