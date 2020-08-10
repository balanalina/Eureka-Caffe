module CaffesHelper
  def products_empty?
    Product.count.eql? 0
  end

  def populate_db
    new_product = Product.new(title: 'Eggs', category: 'Breakfast', price: 12)
    file_path = Rails.root.join('app', 'assets', 'images', 'f1.png')
    new_product.image.attach(io: File.open(file_path), filename: 'f1.png')
    new_product.save!
    new_product = Product.new(title: 'Sweets', category: 'Breakfast', price: 17)
    file_path = Rails.root.join('app', 'assets', 'images', 'f2.png')
    new_product.image.attach(io: File.open(file_path), filename: 'f2.png')
    new_product.save!
    new_product = Product.new(title: 'Gourmet Breakfast', category: 'Breakfast', price: 20)
    file_path = Rails.root.join('app', 'assets', 'images', 'f3.png')
    new_product.image.attach(io: File.open(file_path), filename: 'f3.png')
    new_product.save!
    new_product = Product.new(title: 'Risotto', category: 'Second Courses', price: 45)
    file_path = Rails.root.join('app', 'assets', 'images', 'f4.png')
    new_product.image.attach(io: File.open(file_path), filename: 'f4.png')
    new_product.save!
    new_product = Product.new(title: 'Fancy Meat', category: 'Second Courses', price: 70)
    file_path = Rails.root.join('app', 'assets', 'images', 'f5.png')
    new_product.image.attach(io: File.open(file_path), filename: 'f5.png')
    new_product.save!
    new_product = Product.new(title: 'Sea Weed Rice', category: 'Entrees', price: 37)
    file_path = Rails.root.join('app', 'assets', 'images', 'f6.png')
    new_product.image.attach(io: File.open(file_path), filename: 'f6.png')
    new_product.save!
    new_product = Product.new(title: 'Spaghetti', category: 'Second Courses', price: 40)
    file_path = Rails.root.join('app', 'assets', 'images', 'f7.png')
    new_product.image.attach(io: File.open(file_path), filename: 'f7.png')
    new_product.save!
    new_product = Product.new(title: 'Spotted Burger', category: 'Burgers', price: 70)
    file_path = Rails.root.join('app', 'assets', 'images', 'f8.png')
    new_product.image.attach(io: File.open(file_path), filename: 'f8.png')
    new_product.save!
  end
end
