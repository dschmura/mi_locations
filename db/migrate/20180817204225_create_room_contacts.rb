class CreateRoomContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :room_contacts do |t|
      t.references :room, foreign_key: true
      t.integer :rmrecnbr
      t.string :rm_schd_cntct_name
      t.string :rm_schd_email
      t.string :rm_schd_cntct_phone
      t.string :rm_det_url
      t.string :rm_usage_guidlns_url
      t.string :rm_sppt_deptid
      t.string :rm_sppt_dept_descr
      t.string :rm_sppt_cntct_email
      t.string :rm_sppt_cntct_phone
      t.string :rm_sppt_cntct_url
    end
  end
end
