namespace :f1 do
  desc "Adds Race results for specific [round] in 2014."
  task :seedround, [:round] => [:environment] do |t,args|

    round = args.round.to_i
    if round > 0
      puts "You have entered round number #{round}."
      Seed::Round.run(round)
    else
      puts "Sorry, you have not entered a round number"
      puts "Try: rake f1:seedround[1] , to add the first round."
    end

  end

end
