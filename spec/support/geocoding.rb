Geocoder.configure(lookup: :test)

Geocoder::Lookup::Test.set_default_stub(
  [
    {
      'latitude'     => 40.7143528,
      'longitude'    => -74.0059731,
      'address'      => 'New York, NY, USA',
      'state'        => 'New York',
      'state_code'   => 'NY',
      'country'      => 'United States',
      'country_code' => 'US'
    }
  ]
)

# Via Vite's address and coordinates
Geocoder::Lookup::Test.add_stub(
  "520 Vine St Cincinnati, OH", [
    {
      'latitude'     => 39.101898,
      'longitude'    => -84.5130269,
      'address'      => '520 Vine St Cincinnati, OH',
      'state'        => 'Ohio',
      'state_code'   => 'OH',
      'country'      => 'United States',
      'country_code' => 'US'
    }
  ]
)

# Teller's address and coordinates
Geocoder::Lookup::Test.add_stub(
  "2710 Erie Ave Cincinnati, OH", [
    {
      'latitude'     => 39.1400088,
      'longitude'    => -84.4427847,
      'address'      => '2710 Erie Ave Cincinnati, OH',
      'state'        => 'Ohio',
      'state_code'   => 'OH',
      'country'      => 'United States',
      'country_code' => 'US'
    }
  ]
)