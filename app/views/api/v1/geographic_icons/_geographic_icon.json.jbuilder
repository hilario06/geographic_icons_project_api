json.(geographic_icon, :id, :denomination, :date_of_creation, :height, :history, :city_id, :created_at, :updated_at)
if geographic_icon.image.attached?
  json.url url_for(geographic_icon.image)
else
  json.url ''
end
