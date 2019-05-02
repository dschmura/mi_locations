def building_attributes(overrides = {})
  {
    bldrecnbr: 1234567,
    latitude: 42.2785133809524,
    longitude: -83.7402616825397,
    name: "TESTING BUILDNG NAMED FOR BIG DONER",
    nick_name: "TESTING BUILDING",
    abbreviation: "TEST",
    address: "123 TEST AVE",
    city: "ANN ARBOR",
    state: "MI",
    zip: "48109-1055",
    country: "USA",
  }.merge(overrides)
end
