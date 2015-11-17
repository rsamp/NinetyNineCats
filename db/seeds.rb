# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

cat = Cat.create(birth_date: "10-02-2015", color: "black", name: "Thomas", sex: "M", description: "kitten")
cat = Cat.create!(birth_date: "15-09-2012", color: "pink", name: "Cuddles", sex: "F", description: "cuddly")
cat = Cat.create(birth_date: "06-12-2012", color: "red", name: "Squiggly", sex: "F", description: "cuttlefish")
cat = Cat.create(birth_date: "07-11-2012", color: "green", name: "Alien", sex: "F", description: "Green Eggs and Ham")
cat = Cat.create!(birth_date: "15-09-2012", color: "purple", name: "Breakfast", sex: "M", description: "exotic")
