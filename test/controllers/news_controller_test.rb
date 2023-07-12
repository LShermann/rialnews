require "test_helper"

class NewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @new = news(:one)
  end

  test "should get index" do
    get news_url
    assert_response :success
  end

  test "should get new" do
    get new_new_url
    assert_response :success
  end

  test "should create new" do
    assert_difference("New.count") do
      post news_url, params: { new: { description: @new.description, tittle: @new.tittle } }
    end

    assert_redirected_to new_url(New.last)
  end

  test "should show new" do
    get new_url(@new)
    assert_response :success
  end

  test "should get edit" do
    get edit_new_url(@new)
    assert_response :success
  end

  test "should update new" do
    patch new_url(@new), params: { new: { description: @new.description, tittle: @new.tittle } }
    assert_redirected_to new_url(@new)
  end

  test "should destroy new" do
    assert_difference("New.count", -1) do
      delete new_url(@new)
    end

    assert_redirected_to news_url
  end
end
