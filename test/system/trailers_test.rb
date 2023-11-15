require "application_system_test_case"

class TrailersTest < ApplicationSystemTestCase
  setup do
    @trailer = trailers(:one)
  end

  test "visiting the index" do
    visit trailers_url
    assert_selector "h1", text: "Trailers"
  end

  test "should create trailer" do
    visit trailers_url
    click_on "New trailer"

    fill_in "Dock number", with: @trailer.dock_number
    fill_in "Live load", with: @trailer.live_load
    fill_in "Order number", with: @trailer.order_number
    fill_in "Timer", with: @trailer.timer
    fill_in "Trailer location", with: @trailer.trailer_location
    fill_in "Trailer number", with: @trailer.trailer_number
    fill_in "Truck number", with: @trailer.truck_number
    fill_in "Trucking company", with: @trailer.trucking_company
    click_on "Create Trailer"

    assert_text "Trailer was successfully created"
    click_on "Back"
  end

  test "should update Trailer" do
    visit trailer_url(@trailer)
    click_on "Edit this trailer", match: :first

    fill_in "Dock number", with: @trailer.dock_number
    fill_in "Live load", with: @trailer.live_load
    fill_in "Order number", with: @trailer.order_number
    fill_in "Timer", with: @trailer.timer
    fill_in "Trailer location", with: @trailer.trailer_location
    fill_in "Trailer number", with: @trailer.trailer_number
    fill_in "Truck number", with: @trailer.truck_number
    fill_in "Trucking company", with: @trailer.trucking_company
    click_on "Update Trailer"

    assert_text "Trailer was successfully updated"
    click_on "Back"
  end

  test "should destroy Trailer" do
    visit trailer_url(@trailer)
    click_on "Destroy this trailer", match: :first

    assert_text "Trailer was successfully destroyed"
  end
end
