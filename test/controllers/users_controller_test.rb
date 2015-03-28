require 'test_helper'
require 'users_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: {email: "user_email@example.com", password: "secret", password_confirmation: "secret"}
    end

    assert_redirected_to users_path
  end

  test "should show user" do
    login_user
    get :show, id: @user.to_param
    assert_response :success
  end

  test "should get edit" do
    login_user
    get :edit, id: @user.to_param
    assert_response :success
  end

  test "should update user" do
    login_user
    put :update, id: @user.to_param, user: @user.attributes
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    login_user
    assert_difference('User.count', -1) do
      delete :destroy, id: @user.to_param
    end

    assert_redirected_to users_path
  end
end
