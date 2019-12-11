require "rails_helper"

describe "Search for a room with a specific room characteristic", type: :feature, js: true do
  let(:room) { create(:room) }
  let(:room_characteristic) { create(:room_characteristic, chrstc_descrshort: "DocCam", room_id: :room) }

  scenario "DocCam is selected" do
    visit rooms_path
    check "Document Camera"
    expect(page).to have_content("Document Camera")
  end
end
