require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index," do
    get comments_index,_url
    assert_response :success
  end

  test "should get create," do
    get comments_create,_url
    assert_response :success
  end

  test "should get destroy" do
    get comments_destroy_url
    assert_response :success
  end
end
