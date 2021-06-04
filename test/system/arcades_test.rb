require "application_system_test_case"

class ArcadesTest < ApplicationSystemTestCase
  setup do
    @arcade = arcades(:one)
  end

  test "visiting the index" do
    visit arcades_url
    assert_selector "h1", text: "Arcades"
  end

  test "creating a Arcade" do
    visit arcades_url
    click_on "New Arcade"

    fill_in "Comments count", with: @arcade.comments_count
    click_on "Create Arcade"

    assert_text "Arcade was successfully created"
    click_on "Back"
  end

  test "updating a Arcade" do
    visit arcades_url
    click_on "Edit", match: :first

    fill_in "Comments count", with: @arcade.comments_count
    click_on "Update Arcade"

    assert_text "Arcade was successfully updated"
    click_on "Back"
  end

  test "destroying a Arcade" do
    visit arcades_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Arcade was successfully destroyed"
  end
end
