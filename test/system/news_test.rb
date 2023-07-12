require "application_system_test_case"

class NewsTest < ApplicationSystemTestCase
  setup do
    @new = news(:one)
  end

  test "visiting the index" do
    visit news_url
    assert_selector "h1", text: "News"
  end

  test "should create new" do
    visit news_url
    click_on "New new"

    fill_in "Description", with: @new.description
    fill_in "Tittle", with: @new.tittle
    click_on "Create New"

    assert_text "New was successfully created"
    click_on "Back"
  end

  test "should update New" do
    visit new_url(@new)
    click_on "Edit this new", match: :first

    fill_in "Description", with: @new.description
    fill_in "Tittle", with: @new.tittle
    click_on "Update New"

    assert_text "New was successfully updated"
    click_on "Back"
  end

  test "should destroy New" do
    visit new_url(@new)
    click_on "Destroy this new", match: :first

    assert_text "New was successfully destroyed"
  end
end
