# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
path = Array.wrap(%w[app assets images])
products_array = [{ title: 'Eggs', category: 'Breakfast', price: 12, image: 'f1.png' }, 
                  { title: 'Sweets', category: 'Breakfast', price: 17, image: 'f2.png' },
                  { title: 'Gourmet Breakfast', category: 'Breakfast', price: 20, image: 'f3.png' },
                  { title: 'Risotto', category: 'Second Courses', price: 45, image: 'f4.png' },
                  { title: 'Fancy Meat', category: 'Second Courses', price: 70, image: 'f5.png' },
                  { title: 'Sea Weed Rice', category: 'Entrees', price: 37, image: 'f6.png' },
                  { title: 'Spaghetti', category: 'Second Courses', price: 40, image: 'f7.png' },
                  { title: 'Spotted Burger', category: 'Burgers', price: 70, image: 'f8.png' }]

products_array.each do |hash|
  title = hash[:title]
  category = hash[:category]
  price = hash[:price]
  image = hash[:image]
  file_path = Rails.root.join(path.first, path.second, path.third, image)
  new_product = Product.create_or_find_by!(title: title, category: category, price: price)
  new_product.image.attach(io: File.open(file_path), filename: image)
end

user = User.create(name: 'buna siua', email: 'alina@jmek.com', password: '1111111', activation: true)
Cart.create(user_id: user.id)


