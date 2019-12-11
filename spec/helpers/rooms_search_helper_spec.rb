require "rails_helper"

# Specs in this file have access to a helper object that includes
# the RoomsSearchHelper. For example:
#
# describe RoomsSearchHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe RoomsSearchHelper, type: :helper do
  let(:room) { create(:room) }

  let!(:valid_team_tables) { build(:room_characteristic, chrstc_descrshort: "TeamTables") }

  let!(:valid_team_writing) { build(:room_characteristic, chrstc_descrshort: "TeamWriting") }

  let!(:invalid_characteristics) { build(:room_characteristic, chrstc_descrshort: "") }

  subject(:room_characteristcs) { RoomCharacteristic.where(chrstc_descrshort: "TeamTables") }
  # helper.team_learning?(room.room_characteristics)
  xdescribe "team_learning?" do
    it "returns TRUE if a room includes TeamSeating" do
      expect(team_learning?(valid_team_tables)).to eq(true)
    end
    #
    # xit 'returns FALSE if a room does not include Team Attributes' do
    #   expect(helper.team_learning?(invalid_characteristics)).to eq(false)
    # end
    it { expect(valid_team_tables.chrstc_descrshort).to include("TeamTables") }
  end
end
