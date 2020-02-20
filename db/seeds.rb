# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@categories =[
  { title: 'Misc', description: 'Random misc things'},
  { title: 'New', description: 'New things'},
  { title: 'Done', description: 'Done things'}
]

def create_categories
  @categories.each do |c|
    Category.create(c)
    puts "-----------#{c}---------------------"
  end
end

def main
  create_categories
end

main
