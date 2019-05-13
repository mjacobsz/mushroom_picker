namespace :data_setup do
  desc "Quick script to create a yaml from the mushroom specification"
  task :create_mushroom_attributes do
    File.open("#{Rails.root}/config/mushroom_specification.yml", "r") do |ms|
      File.open("#{Rails.root}/config/mushroom_attributes.yml", "w") do |ma|
        while line = ms.gets
          mushroom_keys_and_all_values = line.split(" ")
          ma.puts mushroom_keys_and_all_values[0]
          mushroom_value_pairs = mushroom_keys_and_all_values[1].split(",")
          mushroom_value_pairs.each do |mvp|
            true_value_and_abbr_value = mvp.split("=")
            ma.puts "\t#{true_value_and_abbr_value[1]}: #{true_value_and_abbr_value[0]}"
          end
        end
      end
    end
  end
end
