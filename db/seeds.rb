# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.create(name: "Charly LI-ION POWERHEAT", description: "Elektrisch beheizbare, weiche Lederhandschuhe zum Gleitschirmfliegen und für Outdoor-Aktivitäten im Winter.", colour: "black", price: 239.5, image_url: "https://images-na.ssl-images-amazon.com/images/I/71hs2IY8T7L._SL1000_.jpg")

Product.create(name: "Charly LI-ION LIGHT", description: "Elektrisch beheizbare, dünne, speziell für den Gleitschirm-, Langlauf- und Reitsport entwickelte Lederhandschuhe.", colour: "black", price: 209.5, image_url: "https://images-na.ssl-images-amazon.com/images/I/61yZiPJ%2BLmL._SL1000_.jpg")

Product.create(name: "Charly LI-ION FIRE PLUS", description: "Elektrisch beheizbare, dünne Handschuhe, die sowohl als Unterziehhandschuhe in Fäustlingen als auch alleine getragen werden können.", colour: "black", price: 179.8, image_url: "https://images-na.ssl-images-amazon.com/images/I/61ry05607uL._SL1000_.jpg")

Order.create(id: 1, user_id: 1, product_id: 1, total: 239.5)

Order.create(id: 2, user_id: 2, product_id: 2, total: 209.5)

Order.create(id: 3, user_id: 3, product_id: 3, total: 179.8)
