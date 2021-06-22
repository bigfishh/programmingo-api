# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Question.destroy_all 

Question.create(prompt: "What is the following question?", snippet: "function sayHi() {\n hi \n return 'hello' \n}")
Question.create(prompt: "What is the following question?", snippet: "function sayHi() { return 'hello' }")