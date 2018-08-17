# == Schema Information
#
# Table name: room_contacts
#
#  id                   :bigint(8)        not null, primary key
#  room_id              :bigint(8)
#  rmrecnbr             :integer
#  rm_schd_cntct_name   :string
#  rm_schd_email        :string
#  rm_schd_cntct_phone  :string
#  rm_det_url           :string
#  rm_usage_guidlns_url :string
#  rm_sppt_deptid       :string
#  rm_sppt_dept_descr   :string
#  rm_sppt_cntct_email  :string
#  rm_sppt_cntct_phone  :string
#  rm_sppt_cntct_url    :string
#

require 'rails_helper'

RSpec.describe RoomContact, type: :model do
let(:room_contact) { build(:room_contact) }

  describe RoomContact do
    describe 'Valid RoomContacts' do
      it { should validate_presence_of(:rmrecnbr) }
    end
  end

end
