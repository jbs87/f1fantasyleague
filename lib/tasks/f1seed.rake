require 'httparty'

namespace :f1seed do
	desc "TODO"
	task trackseed: :environment do

		response = HTTParty.get("http://ergast.com/api/f1/2014/circuits.json")
		circuits = response["MRData"]["CircuitTable"]["Circuits"]
		circuits.each do |track|
			circuitId = track["circuitId"]
			circuitName = track["circuitName"]
			lat = track["Location"]["lat"].to_f
			long = track["Location"]["long"].to_f
			locality = track["Location"]["locality"]
			country = track["Location"]["country"]
			Track.create!({circuitId: circuitId, circuitName: circuitName, lat: lat, long: long,
				locality: locality, country: country})
		end
	end
end
