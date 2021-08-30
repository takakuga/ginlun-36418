require 'test_helper'

class EatsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get eats_index_url
    assert_response :success
  end

end
