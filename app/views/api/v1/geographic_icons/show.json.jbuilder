json.partial! 'api/v1/geographic_icons/geographic_icon', geographic_icon: @geographic_icon
json.set! :city do
  json.partial! 'api/v1/cities/city', city: @geographic_icon.city
end
