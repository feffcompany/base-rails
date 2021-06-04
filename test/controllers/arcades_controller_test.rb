require "test_helper"

class ArcadesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @arcade = arcades(:one)
  end

  test "should get index" do
    get arcades_url
    assert_response :success
  end

  test "should get new" do
    get new_arcade_url
    assert_response :success
  end

  test "should create arcade" do
    assert_difference('Arcade.count') do
      post arcades_url, params: { arcade: { comments_count: @arcade.comments_count } }
    end

    assert_redirected_to arcade_url(Arcade.last)
  end

  test "should show arcade" do
    get arcade_url(@arcade)
    assert_response :success
  end

  test "should get edit" do
    get edit_arcade_url(@arcade)
    assert_response :success
  end

  test "should update arcade" do
    patch arcade_url(@arcade), params: { arcade: { comments_count: @arcade.comments_count } }
    assert_redirected_to arcade_url(@arcade)
  end

  test "should destroy arcade" do
    assert_difference('Arcade.count', -1) do
      delete arcade_url(@arcade)
    end

    assert_redirected_to arcades_url
  end
end
