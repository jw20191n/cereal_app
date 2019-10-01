# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Group.destroy_all
User.destroy_all
Cereal.destroy_all
Transaction.destroy_all
Comment.destroy_all

g1 = Group.create(name: "Mod2", location: "8th floor")
g2 = Group.create(name: "Mod4", location: "8th floor")

user1 = User.create(name:"Amber", img_url:"XX", group_id: g1.id, username: "amber", password: "123")
user2 = User.create(name:"Claire", img_url:"XX", group_id: g2.id, username: "claire", password: "dog")

c1 = Cereal.create(name:"Lucky Charm", amount:10, user_id: user1.id, img_url: "https://images-na.ssl-images-amazon.com/images/I/91%2BxMrv0uOL._SX569_.jpg")
c2 = Cereal.create(name:"Cheerio", amount:10, user_id: user2.id, img_url: "https://ship.ralphs.com/img/Products/500/General-Mills/General-Mills-Honey-Nut-Cheerios-Cereal-016000124950.jpg")

t1 = Transaction.create(user_id: user2.id, cereal_id: c1.id, amount: 2)

r1 = Comment.create(content: "goodbye world!!", user_id: user2.id, cereal_id: c1.id)
r2 = Comment.create(content: "hello world!", user_id:user1.id, cereal_id: c2.id)




