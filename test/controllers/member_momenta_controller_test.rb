require 'test_helper'

class MemberMomentaControllerTest < ActionController::TestCase
  setup do
    @member_momentum = member_momenta(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:member_momenta)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create member_momentum" do
    assert_difference('MemberMomentum.count') do
      post :create, member_momentum: { about_recognition: @member_momentum.about_recognition, momentum_date: @member_momentum.momentum_date, name: @member_momentum.name }
    end

    assert_redirected_to member_momentum_path(assigns(:member_momentum))
  end

  test "should show member_momentum" do
    get :show, id: @member_momentum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @member_momentum
    assert_response :success
  end

  test "should update member_momentum" do
    patch :update, id: @member_momentum, member_momentum: { about_recognition: @member_momentum.about_recognition, momentum_date: @member_momentum.momentum_date, name: @member_momentum.name }
    assert_redirected_to member_momentum_path(assigns(:member_momentum))
  end

  test "should destroy member_momentum" do
    assert_difference('MemberMomentum.count', -1) do
      delete :destroy, id: @member_momentum
    end

    assert_redirected_to member_momenta_path
  end
end
