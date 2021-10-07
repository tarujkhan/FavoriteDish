# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
cuisines = Cuisine.create([{name: 'American'}, {name: 'Chinese'}, {name: 'Japanese'}, 
{name: 'Canadian'}, {name: 'Italian'}, {name: "Russian"}, {name: 'Greek'}, {name: 'French'},
{name: 'German'}, {name: 'Scottish'}, {name: 'Dutch'}, {name: 'Finnish'}, {name: 'South American'}
{name: 'Spanish'}, {name: 'Moroccan'}, {name: 'Middle Eastern'}])
cuisines = Cuisine.all
cuisines.destroy_all