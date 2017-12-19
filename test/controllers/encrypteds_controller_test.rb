require 'test_helper'

class EncryptedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @encrypted = encrypteds(:one)
  end

  test "should get index" do
    get encrypteds_url
    assert_response :success
  end

  test "should get new" do
    get new_encrypted_url
    assert_response :success
  end

  test "should create encrypted" do
    assert_difference('Encrypted.count') do
      post encrypteds_url, params: { encrypted: { message: @encrypted.message } }
    end

    assert_redirected_to encrypted_url(Encrypted.last)
  end

  test "should show encrypted" do
    get encrypted_url(@encrypted)
    assert_response :success
  end

  test "should get edit" do
    get edit_encrypted_url(@encrypted)
    assert_response :success
  end

  test "should update encrypted" do
    patch encrypted_url(@encrypted), params: { encrypted: { message: @encrypted.message } }
    assert_redirected_to encrypted_url(@encrypted)
  end

  test "should destroy encrypted" do
    assert_difference('Encrypted.count', -1) do
      delete encrypted_url(@encrypted)
    end

    assert_redirected_to encrypteds_url
  end
end
