require 'test_helper'

class CompleteControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get complete_index_url
    assert_response :success
  end

end
