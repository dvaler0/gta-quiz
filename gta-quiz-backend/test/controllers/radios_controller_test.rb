require "test_helper"

class RadiosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @radio = radios(:one)
  end

  test "should get index" do
    get radios_url, as: :json
    assert_response :success
  end

  test "should create radio" do
    assert_difference("Radio.count") do
      post radios_url, params: { radio: { name: @radio.name } }, as: :json
    end

    assert_response :created
  end

  test "should show radio" do
    get radio_url(@radio), as: :json
    assert_response :success
  end

  test "should update radio" do
    patch radio_url(@radio), params: { radio: { name: @radio.name } }, as: :json
    assert_response :success
  end

  test "should destroy radio" do
    assert_difference("Radio.count", -1) do
      delete radio_url(@radio), as: :json
    end

    assert_response :no_content
  end
end
