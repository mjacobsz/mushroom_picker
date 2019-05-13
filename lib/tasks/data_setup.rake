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

  desc "Insert mushrooms in the database based on the 'agaricus-lepiota.data' file"
  task :create_mushrooms do
    File.open("#{Rails.root}/config/agaricus-lepiota.data", "r") do |f|
      while line = f.gets do
        puts "Creating: #{line}"
        mushroom_values = line.strip.split(",")
        mushroom = Mushroom.new
        mushroom_values.each_with_index do |mushroom_value, index|
          attribute = MushroomAttributes.keys[index]
          value = MushroomAttributes[attribute][mushroom_value]
          mushroom.send("#{attribute}" + "=", value)
        end
        mushroom.save!
      end
    end
  end
end
