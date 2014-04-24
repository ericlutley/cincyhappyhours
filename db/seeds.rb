Place.destroy_all

# Downtown
p = Place.create name: "Cricket Lounge", address: "601 Vine St, Cincinnati, OH 45202"
p.specials.create starts_at: "16:00", ends_at: "18:00", start_day: 0, end_day: 6,
                           details: "$4 domestic/local bottles\r\n$5 custom cocktails\r\n$8 burger, pulled pork sandwich, or 8 buffalo wings"

p = Place.create name: "Nada", address: "600 Walnut Street, Cincinnati, OH 45202"
p.specials.create starts_at: "15:00", ends_at: "18:00",
                           details: "$2 domestic beers\r\n$3 Mexican beers\r\n$3 Pacifico drafts\r\n$3 tequila/bourbon/vodka\r\n$5 margaritas & sangria\r\n$2 salsa trio\r\n$4 tacos"

p = Place.create name: "Nicholson's Tavern & Pub", address: "625 Walnut St Cincinnati, OH 45202"
p.specials.create starts_at: "15:00", ends_at: "19:00",
                           details: "$4 Shareable Bites\r\n$3 Draught Beers\r\n$4 \"You Call It\" Three Olives Vodka & Premium Well\r\n$5 Wines By The Glass\r\n$6 Signature Cocktails"

p = Place.create name: "The Righteous Room", address: "641 Walnut Street, Cincinnati, OH 45202"
p.specials.create starts_at: "16:00", ends_at: "20:00", end_day: 6, details: "1/2 priced drinks (specialty wines included)"
p.specials.create starts_at: "16:00", ends_at: "02:00", start_day: 2, end_day: 2, details: "$3 Jameson"
p.specials.create starts_at: "20:00", ends_at: "02:00", start_day: 0, end_day: 0, details: "$3 Absolut cocktails"

p= Place.create name: "Via Vite", address: "520 Vine St Cincinnati, OH 45202"
p.specials.create starts_at: "15:00", ends_at: "19:00", details: "$2 Domestic beers\r\n$4 house wine\r\n1/2 priced pizzas"

p = Place.create name: "Igby's", address: "122 E Sixth Street, Cincinnati, OH 45202"
p.specials.create starts_at: "16:00", ends_at: "20:00", end_day: 6, details: "$1 off drafts\r\n$1 off calls\r\n$3 domestic bottles\r\n$5 signature cocktail of the month\r\n$20 select bottles of wine"
p.specials.create starts_at: "21:00", ends_at: "02:00", start_day: 3, end_day: 3, details: "$3 Craft Cans"

# Over the Rhine
p = Place.create name: "Kaze", address: "1400 Vine Street Cincinnati, OH 45202"
p.specials.create starts_at: "17:00", ends_at: "19:00", start_day: 0, end_day: 6,
                           details: "$2 Miller High Life drafts\r\n$3 Sapporo drafts\r\n$4 house hot sake\r\n$4 house wines\r\n$5 specialty cocktails\r\n1/2 priced sushi rolls"

# Hyde Park
p = Place.create name: "Tellers of Hyde Park", address: "2710 Erie Ave Cincinnati, OH 45208"
p.specials.create starts_at: "16:00", ends_at: "19:00", details: "$3.50 wells\r\n$1 off all drafts\r\n$2 select domestic bottles"

# Clifton
p = Place.create name: "The Brass Tap", address: "251 Calhoun St, Cincinnati, OH 45219"
p.specials.create starts_at: "15:00", ends_at: "20:00", details: "$3 local drafts (20+)"
p.specials.create starts_at: "22:00", ends_at: "02:00", start_day: 2, end_day: 2, details: "$2 pints of something delicious"
p.specials.create starts_at: "22:00", ends_at: "02:00", start_day: 3, end_day: 3, details: "$3 pints of Cellar Dweller American Blue\r\n$3 shots of Fireballs"

# Mt. Adams
p = Place.create name: "Tap & Go", address: "950 Pavilion St, Cincinnati, OH", latitude: 39.10777390000001, longitude: -84.49706200000003
p.specials.create starts_at: "17:30", ends_at: "21:00", start_day: 2, end_day: 6, details: "$2.50 domestic bottles\r\n$2.75 drafts\r\n$3.75 well and call drinks"
p.specials.create starts_at: "17:30", ends_at: "02:00", start_day: 4, end_day: 4, details: "$3 Jameson\r\n$3 Fireball\r\n$2 Miller Lite drafts (Mt. Adams Mug Club)\r\nFree pool"
p.specials.create starts_at: "12:00", ends_at: "00:00", start_day: 0, end_day: 0, details: "$3 Bombs"

# The Keystones
key_hp = Place.create name: "Keystone Bar & Grill", address: "3384 Erie Ave, Cincinnati, OH"
key_cov = Place.create name: "Keystone Bar & Grill", address: "313 Greenup St, Covington, KY"
key_clifton = Place.create name: "Keystone Bar & Grill", address: "249 Calhoun St, Cincinnati, OH"

[key_hp, key_cov, key_clifton].each do |key|
  key.specials.create ends_at: "19:00", details: "1/2 priced bottles of wine\r\n$1 wells\r\n$2 off select drafts\r\n$2 domestics"
  key.specials.create starts_at: "10:00", ends_at: "02:00", start_day: 4, end_day: 4, details: "\"Friends with Benefits\" Check in on Facebook or Foursquare and receive half-off our Friends with Benefits bar menu"
  key.specials.create starts_at: "10:00", ends_at: "15:00", start_day: 6, end_day: 6, details: "$14 Mimosa Pitchers"
  key.specials.create starts_at: "10:00", ends_at: "15:00", start_day: 0, end_day: 0, details: "$14 Mimosa Pitchers"
end

key_hp.specials.create details: "1/2 price appetizers"
key_hp.specials.create starts_at: "21:00", ends_at: "01:00", start_day: 1, end_day: 1, details: "$2 PBR"
key_hp.specials.create starts_at: "21:00", ends_at: "01:00", start_day: 2, end_day: 2, details: "$5 off large format bottles"
key_hp.specials.create starts_at: "10:00", ends_at: "18:00", start_day: 6, end_day: 6, details: "5 for $12 Miller and Coors buckets"
key_hp.specials.create starts_at: "10:00", ends_at: "01:00", start_day: 0, end_day: 0, details: "5 for $12 Miller and Coors buckets"

key_cov.specials.create starts_at: "21:00", ends_at: "01:00", start_day: 1, end_day: 1, details: "$2 PBR\r\n$3 Jameson"
key_cov.specials.create starts_at: "21:00", ends_at: "01:00", start_day: 2, end_day: 2, details: "$2.22 Stoli cocktails"
key_cov.specials.create starts_at: "21:00", ends_at: "01:00", start_day: 3, end_day: 3, details: "$2 domestics\r\n$1 off drafts\r\n$2 wells"
key_cov.specials.create starts_at: "10:00", ends_at: "18:00", start_day: 6, end_day: 6, details: "$10 Miller Lite & Miller High Life Buckets"
key_cov.specials.create starts_at: "10:00", ends_at: "18:00", start_day: 0, end_day: 0, details: "$10 Hu-dey Hudepohl Amber buckets"
key_cov.specials.create starts_at: "21:00", ends_at: "01:00", start_day: 0, end_day: 0, details: "1/2 price craft bottle beer"

key_clifton.specials.create starts_at: "21:00", ends_at: "01:00", start_day: 1, end_day: 1, details: "10 for $10 Mini High Life Buckets"
key_clifton.specials.create starts_at: "21:00", ends_at: "01:00", start_day: 2, end_day: 2, details: "$2 Margaritas"
key_clifton.specials.create starts_at: "12:00", ends_at: "01:00", start_day: 3, end_day: 3, details: "$3 select craft cans\r\n$2 select domestic cans"
key_clifton.specials.create starts_at: "10:00", ends_at: "18:00", start_day: 6, end_day: 6, details: "5 for $10 Miller Lite buckets"
key_clifton.specials.create starts_at: "21:00", ends_at: "01:00", start_day: 0, end_day: 0, details: "\"Crazy 8s\" Eight 8-oz Bud Lights for $8"
