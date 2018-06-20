# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# create actors
customer = Customer.create(
  email: "testuser@food.com",
  password: "12345678"
)

# create props
restaurant = Restaurant.create(
  brand: "S11 Foodcourt",
  branch: "City Square Mall",
  description: "Popular local dishes"
)
kitchens = Kitchen.create([
  {
    name: "Blue Lagoon",
    description: "Fruit Juice and Desserts",
    restaurant: restaurant
  },
  {
    name: "Roasted Delights",
    description: "Roasted meat dishes",
    restaurant: restaurant
  },
  {
    name: "Ah Huat Grill",
    description: "Affordable Western Food",
    restaurant: restaurant
  }
])
categories = Category.create([
  {
    title: "Drinks",
    restaurant: restaurant
  },
  {
    title: "Dessert",
    restaurant: restaurant
  },
  {
    title: "Chicken",
    restaurant: restaurant
  },
  {
    title: "Pork",
    restaurant: restaurant
  },
  {
    title: "Fish",
    restaurant: restaurant
  },
  {
    title: "Rice",
    restaurant: restaurant
  },
  {
    title: "Noodles",
    restaurant: restaurant
  }
])
products = Product.create([
  {
    title: "Apple Juice",
    price: 1.99,
    available: "in_stock",
    kitchen: kitchens.first
  },
  {
    title: "Orange Juice",
    price: 1.99,
    available: "in_stock",
    kitchen: kitchens.first
  },
  {
    title: "Watermelon Juice",
    price: 1.99,
    available: "in_stock",
    kitchen: kitchens.first
  },
  {
    title: "Avocado Milkshake",
    price: 4.99,
    available: "in_stock",
    kitchen: kitchens.first
  },
  {
    title: "Cendol",
    price: 9.99,
    available: "in_stock",
    kitchen: kitchens.first
  },
  {
    title: "Ice Kachang",
    price: 9.99,
    available: "in_stock",
    kitchen: kitchens.first
  },
  {
    title: "Ice Jelly",
    price: 7.99,
    available: "in_stock",
    kitchen: kitchens.first
  },
  {
    title: "Roasted Chicken Rice",
    price: 4.99,
    available: "in_stock",
    kitchen: kitchens.second
  },
  {
    title: "Char Siew Rice",
    price: 4.99,
    available: "in_stock",
    kitchen: kitchens.second
  },
  {
    title: "Roasted Chicken Noodles",
    price: 5.99,
    available: "in_stock",
    kitchen: kitchens.second
  },
  {
    title: "Chicken Chop with Mash Potato",
    price: 12.99,
    available: "in_stock",
    kitchen: kitchens.third
  },
  {
    title: "Chicken Cutlet with Coleslaw",
    price: 11.99,
    available: "in_stock",
    kitchen: kitchens.third
  },
  {
    title: "Grilled Dory Fish with Steamed Veggies",
    price: 12.99,
    available: "out_of_stock",
    kitchen: kitchens.third
  }
])
product_categories = ProductCategory.create([
  {
    product: products[0],
    category: categories[0]
  },
  {
    product: products[1],
    category: categories[0]
  },
  {
    product: products[2],
    category: categories[0]
  },
  {
    product: products[3],
    category: categories[0]
  },
  {
    product: products[4],
    category: categories[1]
  },
  {
    product: products[5],
    category: categories[1]
  },
  {
    product: products[6],
    category: categories[1]
  },
  {
    product: products[7],
    category: categories[2]
  },
  {
    product: products[8],
    category: categories[3]
  },
  {
    product: products[9],
    category: categories[2]
  },
  {
    product: products[10],
    category: categories[2]
  },
  {
    product: products[11],
    category: categories[2]
  },
  {
    product: products[12],
    category: categories[4]
  },
  {
    product: products[7],
    category: categories[5]
  },
  {
    product: products[8],
    category: categories[5]
  },
  {
    product: products[9],
    category: categories[6]
  }
])
