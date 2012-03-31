require 'test_helper'

class NotificationEmailsControllerTest < ActionController::TestCase
  setup do
    @notification_email = notification_emails(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:notification_emails)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create notification_email" do
    assert_difference('NotificationEmail.count') do
      post :create, notification_email: @notification_email.attributes
    end

    assert_redirected_to notification_email_path(assigns(:notification_email))
  end

  test "should show notification_email" do
    get :show, id: @notification_email
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @notification_email
    assert_response :success
  end

  test "should update notification_email" do
    put :update, id: @notification_email, notification_email: @notification_email.attributes
    assert_redirected_to notification_email_path(assigns(:notification_email))
  end

  test "should destroy notification_email" do
    assert_difference('NotificationEmail.count', -1) do
      delete :destroy, id: @notification_email
    end

    assert_redirected_to notification_emails_path
  end
end
