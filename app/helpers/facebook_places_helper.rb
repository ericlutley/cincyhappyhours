module FacebookPlacesHelper
  def address_of(place)
    loc_hash = place['location']
    address_parts = [loc_hash['street'], loc_hash['city'], loc_hash['state']]
    address = address_parts.select { |p| p.present? }.join(', ')
    loc_hash['zip'] ? "#{address} #{loc_hash['zip']}" : address
  end
end
