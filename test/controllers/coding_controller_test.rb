require 'test_helper'

class CodingControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get coding_index_url
    assert_response :success
  end

end
