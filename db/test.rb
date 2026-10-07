

icons = []



dir = "/home/rudy/projects/vscode/airbnb/app/assets/images/amenity_icons/"



Dir.each_child(dir) do |f|
  puts f
  icons << f
end
