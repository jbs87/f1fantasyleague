FactoryGirl.define do
  factory :user do
    name "John"
    email "a@goop.com"
    password "app"
    password_confirmation { User.generate_password_confirmation }
  end

  factory :race do
    date DateTime.new(2014,4,3,4,5,6)
    track_id 1
    name "Albert Park Grand Prix Circuit"
    round 1
  end

  factory :track do
    circuitId "albert_park"
    long 144.968
    lat -37.8497
    country "Australia"
    locality "Melbourne"
    circuitName "Albert Park Grand Prix Circuit"
  end

  factory :driver do
    name Faker::Name.name
    price 10000000
    driverId "ericsson"
    image_url ""
  end

    # factory :player_team do
    #   driver1_id: 
    # end


  factory :engine do
    name "Lotus Renault"
    price 35000000
    constructorId "lotus_f1"
    image_url ""
  end

  factory :chassis do
    name "Sauber"
    price 30000000
    constructorId "sauber"
    image_url ""
  end
  # This will use the User class (Admin would have been guessed)
end
