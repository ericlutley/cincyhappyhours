Geocoder.configure(
  # geocoding service (see below for supported options):
  :lookup => :mapquest,

  # to use an API key:
  :api_key => Figaro.env.mapquest_api_key

  # :http_headers => { "Referer" => "http://cinyhappyhours.herokuapp.com" }
)