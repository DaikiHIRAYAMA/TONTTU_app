require 'test_helper'

class SaunasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sauna = saunas(:one)
  end

  test "should get index" do
    get saunas_url
    assert_response :success
  end

  test "should get new" do
    get new_sauna_url
    assert_response :success
  end

  test "should create sauna" do
    assert_difference('Sauna.count') do
      post saunas_url, params: { sauna: { name: @sauna.name, sauna_humidity: @sauna.sauna_humidity, sauna_temperature: @sauna.sauna_temperature, water_temperature: @sauna.water_temperature } }
    end

    assert_redirected_to sauna_url(Sauna.last)
  end

  test "should show sauna" do
    get sauna_url(@sauna)
    assert_response :success
  end

  test "should get edit" do
    get edit_sauna_url(@sauna)
    assert_response :success
  end

  test "should update sauna" do
    patch sauna_url(@sauna), params: { sauna: { name: @sauna.name, sauna_humidity: @sauna.sauna_humidity, sauna_temperature: @sauna.sauna_temperature, water_temperature: @sauna.water_temperature } }
    assert_redirected_to sauna_url(@sauna)
  end

  test "should destroy sauna" do
    assert_difference('Sauna.count', -1) do
      delete sauna_url(@sauna)
    end

    assert_redirected_to saunas_url
  end
end
