# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Group.destroy_all

g1 = Group.create(name: "Mod2", location: "8th floor")
g2 = Group.create(name: "Mod4", location: "8th floor")

user1 = User.create(name:"Amber", img_url:"XX", group_id: g1.id)
user2 = User.create(name:"Claire", img_url:"XX", group_id: g2.id)

c1 = Cereal.create(name:"Lucky Charm", amount:10, user_id: 1)
c2 = Cereal.create(name:"Cheerio", amount:10, user_id: 2)

t1 = Transaction.create(user_id: 2, cereal_id: 1, amount: 2)

r1 = Review.create(rating: 5.0, user_id: 2, cereal_id: 1)
r2 = Review.create(rating: 4.0, user_id:1, cereal_id: 2)




