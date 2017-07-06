require 'httparty'
require 'json'
require 'dotenv-rails'

Pet.destroy_all

zipcodes = ["08226","19103"]
result_sets = []

zipcodes.each do |zipcode|
  url = "http://api.petfinder.com/pet.find?key=#{ENV["PETFINDER_API_KEY"]}&location=#{zipcode}&output=basic&format=json"
  response = HTTParty.get(url)
  result_sets << JSON.parse(response.body)
end

result_sets.each do |result_set|
  result_set["petfinder"]["pets"]["pet"].each do |pet|
    Pet.create(
      name: pet["name"]["$t"],
      animal: pet["animal"]["$t"],
      description: pet["description"]["$t"],
      size: pet["size"]["$t"],
      sex: pet["sex"]["$t"],
      location: pet["contact"]["zip"]["$t"],
      age: pet["age"]["$t"],
      image: pet["media"]["photos"]["photo"][7]["$t"]
    )
  end
end
