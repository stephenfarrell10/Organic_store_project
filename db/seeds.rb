# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)



  Product.create(name: 'Biscuits',
               description:
                   %{
 Try our Organic biscuits, they are delicious and for 2.95 they are a steal.
 },
               image_url: 'biscuits.png',
               price: 2.95)


Product.create(name: 'Butter',
               description:
                   %{
 If you have not tasted organic butter yet you dont know what your missing.
 Why not purchase some for yourself and see what all the fuss is about.
 },
               image_url: 'butter.jpg',
               price: 1.95)

Product.create(name: 'Jam',
               description:
                   %{
 Organic jam and can used on almost anything, it's freshly made each day,
 so it tastes much better than what you get in the supermarkets.
 },
               image_url: 'jam.jpg',
               price: 2.95)

Product.create(name: 'Shampoo',
               description:
                   %{
 Our shampoo is made with natural ingredients and will give your hair,
 that sparkling shine.
 },
               image_url: 'Shampoo.jpg',
               price: 5.95)


Product.create(name: 'Soup',
               description:
                   %{
made with fresh vegetables, our soup will give a taste of rural Ireland.
 },
               image_url: 'soup.jpg',
               price: 2.95)


Product.create(name: 'Strawberries',
               description:
                   %{
 Why what till summer to have some strawberries,our fresh strawberries will give you a taste of summer.
 },
               image_url: 'strawberries.jpg',
               price: 5.95)

Product.create(name: 'Tea',
               description:
                   %{
 Sample a piece of the far east with our organic tea.
 it tastes lovely, and is great for meditation.
 },
               image_url: 'tea.jpg',
               price: 4.95)