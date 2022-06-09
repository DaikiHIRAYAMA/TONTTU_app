require "application_system_test_case"

class SaunasTest < ApplicationSystemTestCase
  setup do
    @sauna = saunas(:one)
  end

  test "visiting the index" do
    visit saunas_url
    assert_selector "h1", text: "Saunas"
  end

  test "creating a Sauna" do
    visit saunas_url
    click_on "New Sauna"

    fill_in "Name", with: @sauna.name
    fill_in "Sauna humidity", with: @sauna.sauna_humidity
    fill_in "Sauna temperature", with: @sauna.sauna_temperature
    fill_in "Water temperature", with: @sauna.water_temperature
    click_on "Create Sauna"

    assert_text "Sauna was successfully created"
    click_on "Back"
  end

  test "updating a Sauna" do
    visit saunas_url
    click_on "Edit", match: :first

    fill_in "Name", with: @sauna.name
    fill_in "Sauna humidity", with: @sauna.sauna_humidity
    fill_in "Sauna temperature", with: @sauna.sauna_temperature
    fill_in "Water temperature", with: @sauna.water_temperature
    click_on "Update Sauna"

    assert_text "Sauna was successfully updated"
    click_on "Back"
  end

  test "destroying a Sauna" do
    visit saunas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sauna was successfully destroyed"
  end
end
