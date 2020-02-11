require 'test_helper'

class ReviewersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get reviewers_new_url
    assert_response :success
  end

end
