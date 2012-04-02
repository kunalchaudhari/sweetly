require 'test_helper'

class PhotosControllerTest < ActionController::TestCase
  setup do
    @photo = photos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:photos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create photo" do
    assert_difference('Photo.count') do
      post :create, photo: { album_id: @photo.album_id, photo: @photo.photo, picasa_id: @photo.picasa_id, sort_order: @photo.sort_order, thumbnail_1: @photo.thumbnail_1, thumbnail_2: @photo.thumbnail_2, thumbnail_3: @photo.thumbnail_3 }
    end

    assert_redirected_to photo_path(assigns(:photo))
  end

  test "should show photo" do
    get :show, id: @photo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @photo
    assert_response :success
  end

  test "should update photo" do
    put :update, id: @photo, photo: { album_id: @photo.album_id, photo: @photo.photo, picasa_id: @photo.picasa_id, sort_order: @photo.sort_order, thumbnail_1: @photo.thumbnail_1, thumbnail_2: @photo.thumbnail_2, thumbnail_3: @photo.thumbnail_3 }
    assert_redirected_to photo_path(assigns(:photo))
  end

  test "should destroy photo" do
    assert_difference('Photo.count', -1) do
      delete :destroy, id: @photo
    end

    assert_redirected_to photos_path
  end
end
