# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Driver.create!({ name: 'Nico Rosberg', price: 0 })
Driver.create!({ name: 'Lewis Hamilton', price: 0 })
Driver.create!({ name: 'Daniel Ricciardo', price: 0 })
Driver.create!({ name: 'Valtteri Bottas', price: 0 })
Driver.create!({ name: 'Sebastian Vettel', price: 0 })
Driver.create!({ name: 'Fernando Alonso', price: 0 })
Driver.create!({ name: 'Jenson Button', price: 0 })
Driver.create!({ name: 'Felipe Massa', price: 0 })
Driver.create!({ name: 'Nico Hülkenberg', price: 0 })
Driver.create!({ name: 'Kevin Magnussen', price: 0 })

Driver.create!({ name: 'Kimi Räikkönen', price: 0 })
Driver.create!({ name: 'Sergio Perez', price: 0 })
Driver.create!({ name: 'Jean-Eric Vergne', price: 0 })
Driver.create!({ name: 'Daniil Kvyat', price: 0 })
Driver.create!({ name: 'Romain Grosjean', price: 0 })
Driver.create!({ name: 'Pastor Maldonado', price: 0 })
Driver.create!({ name: 'Adrian Sutil', price: 0 })
Driver.create!({ name: 'Esteban Gutiérrez', price: 0 })
Driver.create!({ name: 'Jules Bianchi', price: 0 })
Driver.create!({ name: 'Max Chilton', price: 0 })

Driver.create!({ name: 'Kamui Kobayashi', price: 0 })
Driver.create!({ name: 'Marcus Ericsson', price: 0 })


ChassisManufacturer.create!({ name: 'Mercedes Grand Prix', price: 0 })
ChassisManufacturer.create!({ name: 'Red Bull', price: 0 })
ChassisManufacturer.create!({ name: 'Williams', price: 0 })
ChassisManufacturer.create!({ name: 'Ferrari', price: 0 })
ChassisManufacturer.create!({ name: 'McLaren', price: 0 })
ChassisManufacturer.create!({ name: 'Force India F1', price: 0 })
ChassisManufacturer.create!({ name: 'Scuderia Toro Rosso', price: 0 })
ChassisManufacturer.create!({ name: 'Lotus Renault', price: 0 })
ChassisManufacturer.create!({ name: 'Sauber', price: 0 })
ChassisManufacturer.create!({ name: 'Marussia', price: 0 })
ChassisManufacturer.create!({ name: 'Caterham', price: 0 })


Engine.create!({ name: 'Mercedes Grand Prix', price: 0 })
Engine.create!({ name: 'Red Bull', price: 0 })
Engine.create!({ name: 'Williams', price: 0 })
Engine.create!({ name: 'Ferrari', price: 0 })
Engine.create!({ name: 'McLaren', price: 0 })
Engine.create!({ name: 'Force India F1', price: 0 })
Engine.create!({ name: 'Scuderia Toro Rosso', price: 0 })
Engine.create!({ name: 'Lotus Renault', price: 0 })
Engine.create!({ name: 'Sauber', price: 0 })
Engine.create!({ name: 'Marussia', price: 0 })
Engine.create!({ name: 'Caterham', price: 0 })

User.create!({ name: 'Homer', email: 'homer@powerplant.nuke', password: 'a',playerteam_id: 1 })
User.create!({ name: 'Marge', email: 'marge@home.net', password: 'a',playerteam_id: 2 })
User.create!({ name: 'Lisa', email: 'lisa@home.net', password: 'a',playerteam_id: 3 })

PlayerTeam.create!({ user_id: 1, driver1_id: 1, driver2_id: 3, engine_id: 1, chassis_manufacturer_id: 2 })
PlayerTeam.create!({ user_id: 1, driver1_id: 1, driver2_id: 3, engine_id: 5, chassis_manufacturer_id: 2 })
PlayerTeam.create!({ user_id: 1, driver1_id: 3, driver2_id: 1, engine_id: 5, chassis_manufacturer_id: 2 })
PlayerTeam.create!({ user_id: 2, driver1_id: 4, driver2_id: 6, engine_id: 2, chassis_manufacturer_id: 5 })
PlayerTeam.create!({ user_id: 3, driver1_id: 6, driver2_id: 8, engine_id: 3, chassis_manufacturer_id: 1 })