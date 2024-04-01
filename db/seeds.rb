# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# {
#   name:'',
#   age:,
#   enjoys: '',
#   image: ''
#   }

cats = [
  {
    name: 'Chip',
    age: 18,
    enjoys: 'bringing bats into the house',
    image: 'https://images.unsplash.com/photo-1510932309205-50f8913fdb7c?q=80&w=2835&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
  },
  {
    name: 'Stormy',
    age: 7,
    enjoys: 'being in the basement',
    image: 'https://images.unsplash.com/photo-1560456623-3a3373473517?q=80&w=3027&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
  },
  {
  name:'Whiskers',
  age:2,
  enjoys: 'bathing in the sun and eating its weight in food',
  image: 'https://images.unsplash.com/photo-1596854407944-bf87f6fdd49e?q=80&w=2960&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
  }
]

cats.each do |each_cat|
  Cat.create each_cat
  puts "creating cat #{each_cat}"
end