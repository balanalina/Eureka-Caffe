module CaffesHelper
  def products_empty?
    Product.count.eql? 0
  end

  def populate_db
    Product.new(title:'Eggs', category:'Breakfast', price:12, image:'f1.jpg').save!
    Product.new(title:'Sweets', category:'Breakfast', price:17, image:'f2.jpg').save!
    Product.new(title:'Gourmet Breakfast', category:'Breakfast', price:20, image:'f3.jpg').save!
    Product.new(title:'Risotto', category:'Second Courses', price:45, image:'f4.jpg').save!
    Product.new(title:'Fancy Meat', category:'Second Courses', price:70, image:'f5.jpg').save!
    Product.new(title:'Sea Weed Rice', category:'Entrees', price:37, image:'f6.jpg').save!
    Product.new(title:'Spaghetti', category:'Second Courses', price:40, image:'f7.jpg').save!
    Product.new(title:'Spotted Burger', category:'Burgers', price:70, image:'f8.jpg').save!
  end
end
