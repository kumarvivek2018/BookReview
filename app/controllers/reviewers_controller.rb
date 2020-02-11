class ReviewersController < ApplicationController
  def new
    @reviewer = Reviewer.new
    render 'signup'
  end
end
