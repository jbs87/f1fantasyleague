# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Driver.create!({ name: 'Nico Rosberg', score: 0, price: 0 })
Driver.create!({ name: 'Lewis Hamilton', score: 0, price: 0 })
Driver.create!({ name: 'Daniel Ricciardo', score: 0, price: 0 })
Driver.create!({ name: 'Valtteri Bottas', score: 0, price: 0 })
Driver.create!({ name: 'Sebastian Vettel', score: 0, price: 0 })
Driver.create!({ name: 'Fernando Alonso', score: 0, price: 0 })
Driver.create!({ name: 'Jenson Button', score: 0, price: 0 })
Driver.create!({ name: 'Felipe Massa', score: 0, price: 0 })
Driver.create!({ name: 'Nico Hülkenberg', score: 0, price: 0 })
Driver.create!({ name: 'Kevin Magnussen', score: 0, price: 0 })

Driver.create!({ name: 'Kimi Räikkönen', score: 0, price: 0 })
Driver.create!({ name: 'Sergio Perez', score: 0, price: 0 })
Driver.create!({ name: 'Jean-Eric Vergne', score: 0, price: 0 })
Driver.create!({ name: 'Daniil Kvyat', score: 0, price: 0 })
Driver.create!({ name: 'Romain Grosjean', score: 0, price: 0 })
Driver.create!({ name: 'Pastor Maldonado', score: 0, price: 0 })
Driver.create!({ name: 'Adrian Sutil', score: 0, price: 0 })
Driver.create!({ name: 'Esteban Gutiérrez', score: 0, price: 0 })
Driver.create!({ name: 'Jules Bianchi', score: 0, price: 0 })
Driver.create!({ name: 'Max Chilton', score: 0, price: 0 })

Driver.create!({ name: 'Kamui Kobayashi', score: 0, price: 0 })
Driver.create!({ name: 'Marcus Ericsson', score: 0, price: 0 })


Chasis.create!({ name: 'Mercedes Grand Prix', score: 0, price: 0 })
Chasis.create!({ name: 'Red Bull', score: 0, price: 0 })
Chasis.create!({ name: 'Williams', score: 0, price: 0 })
Chasis.create!({ name: 'Ferrari', score: 0, price: 0 })
Chasis.create!({ name: 'McLaren', score: 0, price: 0 })
Chasis.create!({ name: 'Force India F1', score: 0, price: 0 })
Chasis.create!({ name: 'Scuderia Toro Rosso', score: 0, price: 0 })
Chasis.create!({ name: 'Lotus Renault', score: 0, price: 0 })
Chasis.create!({ name: 'Sauber', score: 0, price: 0 })
Chasis.create!({ name: 'Marussia', score: 0, price: 0 })
Chasis.create!({ name: 'Caterham', score: 0, price: 0 })


Engine.create!({ name: 'Mercedes Grand Prix', score: 0, price: 0 })
Engine.create!({ name: 'Red Bull', score: 0, price: 0 })
Engine.create!({ name: 'Williams', score: 0, price: 0 })
Engine.create!({ name: 'Ferrari', score: 0, price: 0 })
Engine.create!({ name: 'McLaren', score: 0, price: 0 })
Engine.create!({ name: 'Force India F1', score: 0, price: 0 })
Engine.create!({ name: 'Scuderia Toro Rosso', score: 0, price: 0 })
Engine.create!({ name: 'Lotus Renault', score: 0, price: 0 })
Engine.create!({ name: 'Sauber', score: 0, price: 0 })
Engine.create!({ name: 'Marussia', score: 0, price: 0 })
Engine.create!({ name: 'Caterham', score: 0, price: 0 })

User.create!({ name: 'Homer', email: 'homer@powerplant.nuke', password: 'a',playerteam_id: 1 })
User.create!({ name: 'Marge', email: 'marge@home.net', password: 'a',playerteam_id: 2 })
User.create!({ name: 'Lisa', email: 'lisa@home.net', password: 'a',playerteam_id: 3 })

PlayerTeam.create!({ user_id: 1, driver1_id: 1, driver2_id: 3, engine_id: 1, chasis_id: 2 })
PlayerTeam.create!({ user_id: 2, driver1_id: 4, driver2_id: 6, engine_id: 2, chasis_id: 5 })
PlayerTeam.create!({ user_id: 3, driver1_id: 6, driver2_id: 8, engine_id: 3, chasis_id: 1 })