files = Dir.glob("**/*")
mass_yamls = files.select{|file_path| file_path.end_with?("massdriver.yaml")}

for app_yaml in mass_yamls do
  directory = app_yaml.sub("/massdriver.yaml", "")
  # feels like it reads better to do this with the slashes...
  is_smooth_operator = File.exists?("#{directory}/operator.md")

  puts "Checks for #{directory}"
  puts "Has operator.md <=> #{is_smooth_operator}" # I had to spaceship operator
  puts
end
