FactoryBot.define do
  factory :room_characteristic do
    rmrecnbr { 1234567 }
    chrstc { 23 }
    chrstc_descrshort { "asdf" }
    chrstc_descr { "asdf" }
    chrstc_desc254 { "asdf" }
    room_id { 1234 }
  end

  factory :room do
    rmrecnbr { 2087524 }
    floor { "0G" }
    room_number { "G580" }
    facility_code_heprod { "DENTG580" }
    rmtyp_description { "Classroom" }
    dept_id { 403000 }
    dept_grp { 0 }
    square_feet { 673 }
    instructional_seating_count { 32 }
    building_id { 2598 }
  end
  factory :building do
    bldrecnbr { 1234567 }
    latitude { 42.2785133809524 }
    longitude { -83.7402616825397 }
    name { "TESTING BUILDNG NAMED FOR BIG DONER" }
    nick_name { "TESTING BUILDING" }
    abbreviation { "TEST" }
    address { "123 TEST AVE" }
    city { "ANN ARBOR" }
    state { "MI" }
    zip { "48109-1055" }
    country { "USA" }
  end
end
