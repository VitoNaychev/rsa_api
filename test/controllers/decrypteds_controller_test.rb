require 'test_helper'

class DecryptedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @decrypted = decrypteds(:one)
  end

  test "should get index" do
    get decrypteds_url
    assert_response :success
  end

  test "should get new" do
    get new_decrypted_url
    assert_response :success
  end

  test "should create decrypted" do
    assert_difference('Decrypted.count') do
      post decrypteds_url, params: { decrypted: { message: @decrypted.message } }
    end

    assert_redirected_to decrypted_url(Decrypted.last)
  end

  test "should show decrypted" do
    get decrypted_url(@decrypted)
    assert_response :success
  end

  test "should get edit" do
    get edit_decrypted_url(@decrypted)
    assert_response :success
  end

  test "should update decrypted" do
    patch decrypted_url(@decrypted), params: { decrypted: { message: @decrypted.message } }
    assert_redirected_to decrypted_url(@decrypted)
  end

  test "should destroy decrypted" do
    assert_difference('Decrypted.count', -1) do
      delete decrypted_url(@decrypted)
    end

    assert_redirected_to decrypteds_url
  end
end
