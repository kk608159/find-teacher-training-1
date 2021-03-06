def stub_geocoder
  Geocoder.configure(lookup: :test)

  Geocoder::Lookup::Test.set_default_stub(
    [
      {
        "coordinates" => [51.4524877, -0.1204749],
        "address" => "AA Teamworks W Yorks SCITT, School Street, Greetland, Halifax, West Yorkshire HX4 8JB",
        "state" => "England",
        "country" => "United Kingdom",
        "country_code" => "UK",
      },
    ],
  )

  Geocoder::Lookup::Test.add_stub(
    "SW1P 3BT",
    [
      {
        "coordinates" => [51.4980188, -0.1300436],
        "address" => "Westminster, London SW1P 3BT, UK",
        "state" => "England",
        "state_code" => "England",
        "country" => "United Kingdom",
        "country_code" => "UK",
      },
    ],
  )

  Geocoder::Lookup::Test.add_stub(
    "Unknown location",
    [],
  )
end
