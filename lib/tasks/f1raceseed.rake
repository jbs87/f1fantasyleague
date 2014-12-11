require 'httparty'

namespace :f1raceseed do
	desc "TODO"
	task raceseed: :environment do
		response = HTTParty.get("http://ergast.com/api/f1/2014.json")
		races = response["MRData"]["RaceTable"]["Races"]
		races.each do |track|
			trackId = Track.find_by(circuitId: track["Circuit"]["circuitId"]).id
			date = DateTime.parse(track["date"] + "-" + track["time"])
			circuitName = track["Circuit"]["circuitName"]
			round = track["round"].to_i
			Race.create!({track_id: trackId, name: circuitName, date: date, round: round })
		end
	end

end
