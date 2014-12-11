# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Driver.create!({ name: 'Nico Rosberg', price: 0, nickname: 'rosberg'  })
Driver.create!({ name: 'Lewis Hamilton', price: 0, nickname: 'hamilton'  })
Driver.create!({ name: 'Daniel Ricciardo', price: 0, nickname: 'ricciardo'  })
Driver.create!({ name: 'Sebastian Vettel', price: 0, nickname: 'vettel'  })
Driver.create!({ name: 'Valtteri Bottas', price: 0, nickname: 'bottas'  })
Driver.create!({ name: 'Felipe Massa', price: 0, nickname: 'massa'  })
Driver.create!({ name: 'Kimi Räikkönen', price: 0, nickname: 'raikkonen'  })
Driver.create!({ name: 'Fernando Alonso', price: 0, nickname: 'alonso'  })
Driver.create!({ name: 'Jenson Button', price: 0, nickname: 'button'  })
Driver.create!({ name: 'Kevin Magnussen', price: 0, nickname: 'kevin_magnussen' })
Driver.create!({ name: 'Nico Hülkenberg', price: 0, nickname: 'hulkenberg' })
Driver.create!({ name: 'Sergio Perez', price: 0, nickname: 'perez' })
Driver.create!({ name: 'Jean-Eric Vergne', price: 0, nickname: 'vergne' })
Driver.create!({ name: 'Daniil Kvyat', price: 0, nickname: 'kvyat' })
Driver.create!({ name: 'Romain Grosjean', price: 0, nickname: 'grosjean' })
Driver.create!({ name: 'Pastor Maldonado', price: 0, nickname: 'maldonado' })
Driver.create!({ name: 'Adrian Sutil', price: 0, nickname: 'sutil' })
Driver.create!({ name: 'Esteban Gutiérrez', price: 0, nickname: 'gutierrez' })
Driver.create!({ name: 'Jules Bianchi', price: 0, nickname: 'jules_bianchi' })
Driver.create!({ name: 'Max Chilton', price: 0, nickname: 'chilton' })
Driver.create!({ name: 'Kamui Kobayashi', price: 0, nickname: 'kobayashi' })
Driver.create!({ name: 'Marcus Ericsson', price: 0, nickname: 'ericsson' })


ChassisManufacturer.create!({ name: 'Mercedes Grand Prix', price: 0, constructorId: 'mercedes' })
ChassisManufacturer.create!({ name: 'Red Bull', price: 0, constructorId: 'red_bull' })
ChassisManufacturer.create!({ name: 'Williams', price: 0, constructorId: 'williams' })
ChassisManufacturer.create!({ name: 'Ferrari', price: 0, constructorId: 'ferrari' })
ChassisManufacturer.create!({ name: 'McLaren', price: 0, constructorId: 'mclaren' })
ChassisManufacturer.create!({ name: 'Force India F1', price: 0, constructorId: 'force_india' })
ChassisManufacturer.create!({ name: 'Scuderia Toro Rosso', price: 0, constructorId: 'toro_rosso' })
ChassisManufacturer.create!({ name: 'Lotus Renault', price: 0, constructorId: 'lotus_f1' })
ChassisManufacturer.create!({ name: 'Sauber', price: 0, constructorId: 'sauber' })
ChassisManufacturer.create!({ name: 'Marussia', price: 0, constructorId: 'marussia' })
ChassisManufacturer.create!({ name: 'Caterham', price: 0, constructorId: 'caterham' })


Engine.create!({ name: 'Mercedes Grand Prix', price: 0, constructorId: 'mercedes' })
Engine.create!({ name: 'Red Bull', price: 0, constructorId: 'red_bull' })
Engine.create!({ name: 'Williams', price: 0, constructorId: 'williams' })
Engine.create!({ name: 'Ferrari', price: 0, constructorId: 'ferrari' })
Engine.create!({ name: 'McLaren', price: 0, constructorId: 'mclaren' })
Engine.create!({ name: 'Force India F1', price: 0, constructorId: 'force_india' })
Engine.create!({ name: 'Scuderia Toro Rosso', price: 0, constructorId: 'toro_rosso' })
Engine.create!({ name: 'Lotus Renault', price: 0, constructorId: 'lotus_f1' })
Engine.create!({ name: 'Sauber', price: 0, constructorId: 'sauber'  })
Engine.create!({ name: 'Marussia', price: 0, constructorId: 'marussia' })
Engine.create!({ name: 'Caterham', price: 0, constructorId: 'caterham' })

User.create!({ name: 'Homer', email: 'homer@powerplant.nuke', password: 'a', password_confirmation: 'a'})
User.create!({ name: 'Marge', email: 'marge@home.net', password: 'a', password_confirmation: 'a'})
User.create!({ name: 'Lisa', email: 'lisa@home.net', password: 'a', password_confirmation: 'a'})

PlayerTeam.create!({ user_id: 1, driver1_id: 1, driver2_id: 3, engine_id: 1, chassis_manufacturer_id: 2 })
PlayerTeam.create!({ user_id: 1, driver1_id: 1, driver2_id: 3, engine_id: 5, chassis_manufacturer_id: 2 })
PlayerTeam.create!({ user_id: 1, driver1_id: 3, driver2_id: 1, engine_id: 5, chassis_manufacturer_id: 2 })
PlayerTeam.create!({ user_id: 2, driver1_id: 4, driver2_id: 6, engine_id: 2, chassis_manufacturer_id: 5 })
PlayerTeam.create!({ user_id: 3, driver1_id: 6, driver2_id: 8, engine_id: 3, chassis_manufacturer_id: 1 })

ScoringOverview.create!({position:1, driver_qual: 30, driver_race: 100, chassis_qual: 15, chassis_race: 45})
ScoringOverview.create!({position:2, driver_qual: 20, driver_race: 80, chassis_qual: 10, chassis_race: 35})
ScoringOverview.create!({position:3, driver_qual: 18, driver_race: 70, chassis_qual: 7, chassis_race: 30})
ScoringOverview.create!({position:4, driver_qual: 16, driver_race: 60, chassis_qual: 5, chassis_race: 26})
ScoringOverview.create!({position:5, driver_qual: 15, driver_race: 50, chassis_qual: 4, chassis_race: 24})
ScoringOverview.create!({position:6, driver_qual: 14, driver_race: 40, chassis_qual: 3, chassis_race: 22})
ScoringOverview.create!({position:7, driver_qual: 13, driver_race: 35, chassis_qual: 2, chassis_race: 20})
ScoringOverview.create!({position:8, driver_qual: 12, driver_race: 28, chassis_qual: 1, chassis_race: 18})
ScoringOverview.create!({position:9, driver_qual: 11, driver_race: 24, chassis_qual: 0, chassis_race: 16})
ScoringOverview.create!({position:10, driver_qual: 10, driver_race: 20, chassis_qual: 0, chassis_race: 14})
ScoringOverview.create!({position:11, driver_qual: 9, driver_race: 16, chassis_qual: 0, chassis_race: 12})
ScoringOverview.create!({position:12, driver_qual: 8, driver_race: 14, chassis_qual: 0, chassis_race: 10})
ScoringOverview.create!({position:13, driver_qual: 7, driver_race: 10, chassis_qual: 0, chassis_race: 8})
ScoringOverview.create!({position:14, driver_qual: 6, driver_race: 8, chassis_qual: 0, chassis_race: 6})
ScoringOverview.create!({position:15, driver_qual: 5, driver_race: 6, chassis_qual: 0, chassis_race: 5})
ScoringOverview.create!({position:16, driver_qual: 4, driver_race: 5, chassis_qual: 0, chassis_race: 4})
ScoringOverview.create!({position:17, driver_qual: 3, driver_race: 4, chassis_qual: 0, chassis_race: 3})
ScoringOverview.create!({position:18, driver_qual: 2, driver_race: 3, chassis_qual: 0, chassis_race: 2})
ScoringOverview.create!({position:19, driver_qual: 1, driver_race: 2, chassis_qual: 0, chassis_race: 1})
ScoringOverview.create!({position:20, driver_qual: 0, driver_race: 1, chassis_qual: 0, chassis_race: 0})
ScoringOverview.create!({position:21, driver_qual: 0, driver_race: 0, chassis_qual: 0, chassis_race: 0})
ScoringOverview.create!({position:22, driver_qual: 0, driver_race: 0, chassis_qual: 0, chassis_race: 0})
ScoringOverview.create!({position:23, driver_qual: 0, driver_race: 0, chassis_qual: 0, chassis_race: 0})
ScoringOverview.create!({position:24, driver_qual: 0, driver_race: 0, chassis_qual: 0, chassis_race: 0})

ValueOverview.create!({position:1, driver_race:9000000,chassis_race:3000000})
ValueOverview.create!({position:2, driver_race:8000000,chassis_race:2500000})
ValueOverview.create!({position:3, driver_race:7500000,chassis_race:2000000})
ValueOverview.create!({position:4, driver_race:7000000,chassis_race:1750000})
ValueOverview.create!({position:5, driver_race:6000000,chassis_race:1500000})
ValueOverview.create!({position:6, driver_race:5500000,chassis_race:1250000})
ValueOverview.create!({position:7, driver_race:5000000,chassis_race:1000000})
ValueOverview.create!({position:8, driver_race:4000000,chassis_race:750000})
ValueOverview.create!({position:9, driver_race:3000000,chassis_race:500000})
ValueOverview.create!({position:10, driver_race:2000000,chassis_race:250000})
ValueOverview.create!({position:11, driver_race:1000000,chassis_race:100000})
ValueOverview.create!({position:12, driver_race:500000,chassis_race:0})
ValueOverview.create!({position:13, driver_race:0,chassis_race:0})
ValueOverview.create!({position:14, driver_race:0,chassis_race:0})
ValueOverview.create!({position:15, driver_race:-500000,chassis_race:-100000})
ValueOverview.create!({position:16, driver_race:-1000000,chassis_race:-250000})
ValueOverview.create!({position:17, driver_race:-2000000,chassis_race:-500000})
ValueOverview.create!({position:18, driver_race:-2500000,chassis_race:-750000})
ValueOverview.create!({position:19, driver_race:-3000000,chassis_race:-1000000})
ValueOverview.create!({position:20, driver_race:-3500000,chassis_race:-1250000})
ValueOverview.create!({position:21, driver_race:-4000000,chassis_race:-1500000})
ValueOverview.create!({position:22, driver_race:-4500000,chassis_race:-1750000})
ValueOverview.create!({position:23, driver_race:-5000000,chassis_race:-2000000})
ValueOverview.create!({position:24, driver_race:-5500000,chassis_race:-2250000})

(1..19).each do |i|
	TeamMember.create!({driver_id: 1,chassis_manufacturer_id: 1, engine_id: 1, race_id: i})
	TeamMember.create!({driver_id: 2,chassis_manufacturer_id: 1, engine_id: 1, race_id: i})
	TeamMember.create!({driver_id: 3,chassis_manufacturer_id: 2, engine_id: 2, race_id: i})
	TeamMember.create!({driver_id: 4,chassis_manufacturer_id: 2, engine_id: 2, race_id: i})
	TeamMember.create!({driver_id: 5,chassis_manufacturer_id: 3, engine_id: 3, race_id: i})
	TeamMember.create!({driver_id: 6,chassis_manufacturer_id: 3, engine_id: 3, race_id: i})
	TeamMember.create!({driver_id: 7,chassis_manufacturer_id: 4, engine_id: 4, race_id: i})
	TeamMember.create!({driver_id: 8,chassis_manufacturer_id: 4, engine_id: 4, race_id: i})
	TeamMember.create!({driver_id: 9,chassis_manufacturer_id: 5, engine_id: 5, race_id: i})
	TeamMember.create!({driver_id: 10,chassis_manufacturer_id: 5, engine_id: 5, race_id: i})
	TeamMember.create!({driver_id: 11,chassis_manufacturer_id: 6, engine_id: 6, race_id: i})
	TeamMember.create!({driver_id: 12,chassis_manufacturer_id: 6, engine_id: 6, race_id: i})
	TeamMember.create!({driver_id: 13,chassis_manufacturer_id: 7, engine_id: 7, race_id: i})
	TeamMember.create!({driver_id: 14,chassis_manufacturer_id: 7, engine_id: 7, race_id: i})
	TeamMember.create!({driver_id: 15,chassis_manufacturer_id: 8, engine_id: 8, race_id: i})
	TeamMember.create!({driver_id: 16,chassis_manufacturer_id: 8, engine_id: 8, race_id: i})
	TeamMember.create!({driver_id: 17,chassis_manufacturer_id: 9, engine_id: 9, race_id: i})
	TeamMember.create!({driver_id: 18,chassis_manufacturer_id: 9, engine_id: 9, race_id: i})
	TeamMember.create!({driver_id: 19,chassis_manufacturer_id: 10, engine_id: 10, race_id: i})
	TeamMember.create!({driver_id: 20,chassis_manufacturer_id: 10, engine_id: 10, race_id: i})
	TeamMember.create!({driver_id: 21,chassis_manufacturer_id: 11, engine_id: 11, race_id: i})
	TeamMember.create!({driver_id: 22,chassis_manufacturer_id: 11, engine_id: 11, race_id: i})
end

Race.create!({date: Time.new(14,03,01), track_id: 1, name: "Australian GP", round: 1})
Race.create!({date: Time.new(14,04,01), track_id: 2, name: "Canadian GP", round: 2})
Race.create!({date: Time.new(14,05,01), track_id: 3, name: "US GP", round: 3})
Race.create!({date: Time.new(14,06,01), track_id: 4, name: "British GP", round: 4})