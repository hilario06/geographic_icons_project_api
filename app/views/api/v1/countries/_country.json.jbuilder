json.extract! country, :id, :denomination, :number_of_inhabitants, :totat_surface_area, :continent_id
if country.image.attached?
  json.url url_for(country.image)
else
  json.url ''
end
