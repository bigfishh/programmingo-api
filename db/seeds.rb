# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Question.destroy_all 

question1 = Question.create(prompt: "What's the output?", snippet: "function sayHi() {\n
    console.log(name);\n
    console.log(age);\n
    var name = 'Lydia';\n
    let age = 21;\n
}\n
sayHi();")

Answer.create(question_id: question1.id, correct: false, option: "Lydia and undefined")
Answer.create(question_id: question1.id, correct: false, option: "Lydia and ReferenceError")
Answer.create(question_id: question1.id, correct: false, option: "ReferenceError and 21")
Answer.create(question_id: question1.id, correct: true, option: "undefined and ReferenceError", explanation: "Within the function, we first declare the name variable with the var keyword. This means that the variable gets hoisted (memory space is set up during the creation phase) with the default value of undefined, until we actually get to the line where we define the variable. We haven't defined the variable yet on the line where we try to log the name variable, so it still holds the value of undefined.\n
Variables with the let keyword (and const) are hoisted, but unlike var, don't get initialized. They are not accessible before the line we declare (initialize) them. This is called the 'temporal dead zone'. When we try to access the variables before they are declared, JavaScript throws a ReferenceError.")


