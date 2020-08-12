# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

new_product = Product.create_or_find_by!(title: 'Eggs', category: 'Breakfast', price: 12)
file_path = Rails.root.join('app', 'assets', 'images', 'f1.png')
new_product.image.attach(io: File.open(file_path), filename: 'f1.png')
new_product = Product.create_or_find_by!(title: 'Sweets', category: 'Breakfast', price: 17)
file_path = Rails.root.join('app', 'assets', 'images', 'f2.png')
new_product.image.attach(io: File.open(file_path), filename: 'f2.png')
new_product = Product.create_or_find_by!(title: 'Gourmet Breakfast', category: 'Breakfast', price: 20)
file_path = Rails.root.join('app', 'assets', 'images', 'f3.png')
new_product.image.attach(io: File.open(file_path), filename: 'f3.png')
new_product = Product.create_or_find_by!(title: 'Risotto', category: 'Second Courses', price: 45)
file_path = Rails.root.join('app', 'assets', 'images', 'f4.png')
new_product.image.attach(io: File.open(file_path), filename: 'f4.png')
new_product = Product.create_or_find_by!(title: 'Fancy Meat', category: 'Second Courses', price: 70)
file_path = Rails.root.join('app', 'assets', 'images', 'f5.png')
new_product.image.attach(io: File.open(file_path), filename: 'f5.png')
new_product = Product.create_or_find_by!(title: 'Sea Weed Rice', category: 'Entrees', price: 37)
file_path = Rails.root.join('app', 'assets', 'images', 'f6.png')
new_product.image.attach(io: File.open(file_path), filename: 'f6.png')
new_product = Product.create_or_find_by!(title: 'Spaghetti', category: 'Second Courses', price: 40)
file_path = Rails.root.join('app', 'assets', 'images', 'f7.png')
new_product.image.attach(io: File.open(file_path), filename: 'f7.png')
new_product = Product.create_or_find_by!(title: 'Spotted Burger', category: 'Burgers', price: 70)
file_path = Rails.root.join('app', 'assets', 'images', 'f8.png')
new_product.image.attach(io: File.open(file_path), filename: 'f8.png')
