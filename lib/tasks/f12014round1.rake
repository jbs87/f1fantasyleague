namespace :f1 do
  desc "Adds Race results for 2014 round 1"
  task seedfirstrace: :environment do

    Seed::FirstRace.run

  end

end
