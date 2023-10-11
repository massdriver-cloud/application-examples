files = Dir.glob("**/*")
mass_yamls = files.select{|file_path| file_path.end_with?("massdriver.yaml")}

for app_yaml in mass_yamls do
  directory = app_yaml.sub("/massdriver.yaml", "")
  # feels like it reads better to do this with the slashes...
  has_readme = File.exists?("#{directory}/README.md")
  is_smooth_operator = File.exists?("#{directory}/operator.md")

  puts "Checks for #{directory}"
  puts "Has README.md   <=> #{has_readme}" # I had to spaceship operator
  puts "Has operator.md <=> #{is_smooth_operator}"
  puts "Grade           <=> #{has_readme && is_smooth_operator ? "A" : (has_readme || is_smooth_operator) ? "B" : "C"}"
  puts
end
