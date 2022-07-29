json.(city, :id, :denomination, :number_of_inhabitants, :totat_surface_area, :country_id)
if city.image.attached?
  json.url url_for(city.image)
else
  json.url ''
end
