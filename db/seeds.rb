# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

myfile = File.open("db/data/cities.txt")
mylines=myfile.readlines

mylines.each do |line|
  code, name ,shortname= line.chomp.split("|")
  City.create!(:name => name, :code => code, :shortname => shortname)
  
end
