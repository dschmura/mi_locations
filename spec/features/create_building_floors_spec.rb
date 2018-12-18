require 'rails_helper'

feature 'Create building floor' do
  let(:building) { create(:building) }

  scenario 'filling in add a floor form' do
    visit new_building_building_floor_path(building)
    expect(page).to have_content('Add Floor')

    fill_in "building_floor[floor_label]", with: '12'
    click_button 'Create Floor'

    expect(page).to have_content('BuildingFloor was successfully created')
    expect(BuildingFloor.count).to eq 1
    building_floor = BuildingFloor.last

    expect(building_floor).to have_attributes(
      building_id: building.id
    )

  end
  # describe "Valid Buildings: " do
  #   it { should validate_presence_of(:bldrecnbr) }
  #   it { should validate_presence_of(:name) }
  #   it { should validate_presence_of(:address) }
  #   it { should validate_presence_of(:city) }
  #   it { should validate_presence_of(:state) }
  #   it { should validate_presence_of(:zip) }
  #   it { should validate_presence_of(:country) }
  #
  # end

end
