desc "Link places to their Facebook pages/places"
task :link_places => :environment do
  Place.where(facebook_id: nil).find_each do |place|
    loc = "#{place.latitude}, #{place.longitude}"
    puts "Searching for #{place.name} near #{loc}"
    result = FacebookPlaces.search(place.name, loc, 1).first
    if result
      fb_id = result['id']
      place.update_attributes!(facebook_id: fb_id)
      puts "Matched place \"#{place.name}\" (#{place.id}) to Facebook place \"#{result['name']}\" (#{fb_id})"
    end
  end
end
