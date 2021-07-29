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

question2 = Question.create(prompt: "What's the output?", snippet: "for (var i = 0; i < 3; i++) {\n
    setTimeout(() => console.log(i), 1);\n
}\n
\n
for (let i = 0; i < 3; i++) {\n
    setTimeout(() => console.log(i), 1);\n
}\n
sayHi();")

Answer.create(question_id: question2.id, correct: false, option: "0 1 2 and 0 1 2")
Answer.create(question_id: question2.id, correct: false, option: "0 1 2 and 3 3 3")
Answer.create(question_id: question2.id, correct: true, option: "3 3 3 and 0 1 2", explanation: "Because of the event queue in JavaScript, the setTimeout callback function is called after the loop has been executed. Since the variable i in the first loop was declared using the var keyword, this value was global. During the loop, we incremented the value of i by 1 each time, using the unary operator ++. By the time the setTimeout callback function was invoked, i was equal to 3 in the first example.\n
\n
In the second loop, the variable i was declared using the let keyword: variables declared with the let (and const) keyword are block-scoped (a block is anything between { }). During each iteration, i will have a new value, and each value is scoped inside the loop.")

question3 = Question.create(prompt: "What's the output?", snippet: "const shape = {\n
    radius: 10,\n
    diameter() {\n
      return this.radius * 2;\n
    },\n
    perimeter: () => 2 * Math.PI * this.radius,\n
};\n
\n
console.log(shape.diameter());\n
console.log(shape.perimeter());")

Answer.create(question_id: question3.id, correct: false, option: "20 and 62.83185307179586")
Answer.create(question_id: question3.id, correct: true, option: "20 and NaN", explanation:"Note that the value of diameter is a regular function, whereas the value of perimeter is an arrow function.\n
\n
With arrow functions, the this keyword refers to its current surrounding scope, unlike regular functions! This means that when we call perimeter, it doesn't refer to the shape object, but to its surrounding scope (window for example).\n
\n
There is no value radius on that object, which returns NaN.")
Answer.create(question_id: question3.id, correct: false, option: "20 and 63")
Answer.create(question_id: question3.id, correct: false, option: "NaN and 63")

question4 = Question.create(prompt: "What's the output?", snippet: "+true;\n
!'Lydia';")

Answer.create(question_id: question4.id, correct: false, option: "1 and false")
Answer.create(question_id: question4.id, correct: false, option: "false and NaN")
Answer.create(question_id: question4.id, correct: false, option: "false and false")

question5 = Question.create(prompt: "Which one is true?", snippet: "const bird = {\n
    size: 'small'\n
};\n
\n
const mouse = {\n
    name: 'Mickey',\n
    small: true\n
};")

Answer.create(question_id: question5.id, correct: true, option: "mouse.bird.size is not valid", explanation: "In JavaScript, all object keys are strings (unless it's a Symbol). Even though we might not type them as strings, they are always converted into strings under the hood.\n
\n
JavaScript interprets (or unboxes) statements. When we use bracket notation, it sees the first opening bracket [ and keeps going until it finds the closing bracket ]. Only then, it will evaluate the statement.\n
\n
mouse[bird.size]: First it evaluates bird.size, which is 'small'. mouse['small'] returns true\n
\n
However, with dot notation, this doesn't happen. mouse does not have a key called bird, which means that mouse.bird is undefined. Then, we ask for the size using dot notation: mouse.bird.size. Since mouse.bird is undefined, we're actually asking undefined.size. This isn't valid, and will throw an error similar to Cannot read property 'size' of undefined.")
Answer.create(question_id: question5.id, correct: false, option: "mouse[bird.size] is not valid")
Answer.create(question_id: question5.id, correct: false, option: "mouse[bird['size']] is not valid")
Answer.create(question_id: question5.id, correct: false, option: "All of them are valid")
