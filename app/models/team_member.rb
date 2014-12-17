class TeamMember < ActiveRecord::Base
	attr_accessor :name, :round

	include HTTParty
	base_uri 'http://ergast.com/api/'

	has_many :race_results
	belongs_to :driver
	belongs_to :engine
	belongs_to :chassis_manufacturer
	belongs_to :race

	# def initialize(name, round)
 #      @name   = name.capitalize
 #      @round  = round
 #    end

	def self.tmembers
		racers = {}
		race_data.each do |racer|
			#racers.push(racer["Driver"]["driverId"])
			racers[:racer["Driver"]["driverId"]] = racer["Constructor"]["constructorId"]
		end
		# binding.pry
	end

	 private
    
      def self.race_data
        response = get("/f1/2014/1/results.json")
		race = response['MRData']['RaceTable']['Races'][0]["Results"]
      end


end
