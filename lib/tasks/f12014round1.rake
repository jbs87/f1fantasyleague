namespace :f1 do
  desc "TODO"
  task seedfirstrace: :environment do

    Seed::FirstRace.run

  end

end
