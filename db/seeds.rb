# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
Post.create(:name => 'Post number 1', :text => 'lalalal', :permalink => 'hello-me', :image_id => 1 )
Post.create(:name => 'Post number 2', :text => 'Lorem ipsum <p>Lorem Impsuuum</p> <strong>Ha hahaha</strong> <p> See you later</p>', :permalink => 'lorem-ipsum-me', :image_id => 2)
