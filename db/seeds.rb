# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create!([
  {name: "John Doe", email: "johndoe@mail.ru"},
  {name: "Jane Doe", email: "janedoe@mail.ru"},
  {name: "Harry Potter", email: "harrypotter@mail.ru"}
])

category = Category.create!([ {title: "История"}, {title: "Обществознание"}])

tests = Test.create!([
  #Test: 1
  {title: "Древняя Русь", level: 1, category: category[0], author: users[0]},
  #Test: 2
  {title: "Территориально-государственное устройство", level: 2, category: category[1], author: users[0]},
  #Test: 3
  {title: "Субьекты РФ", level: 6, category: category[1], author: users[1]}
])

questions = Question.create!([
  #Test: 1
  {body: "Какие племена существовали:", test: tests[0]},
  {body: "Что в Древней Руси называлось полюдьем:", test: tests[0]},
  {body: "Какое из событий произошло позже всех остальных:", test: tests[0]},
  {body: "В Древней Руси налог в пользу церкви назывался:", test: tests[0]},

  #Test: 2
  {body: "Какие цвета включает флаг РФ:", test: tests[1]},
  {body: "Количество субьектов РФ:", test: tests[1]},
  {body: "Стремление нации к отделению называется:", test: tests[1]},
  {body: "Что из этого является формой правления:", test: tests[1]},

  #Test: 3
  {body: "Количество республик в РФ:", test: tests[2]},
  {body: "Количество городов федерального значения:", test: tests[2]},
  {body: "Количество краёв:", test: tests[2]},
  {body: "Количество автономных областей:", test: tests[2]},
  {body: "Количество областей:", test: tests[2]},
  {body: "Количество автономных округов:", test: tests[2]}
])

Answer.create!([
  #Test: 1
  {body: "древляне", question: questions[0], correct: true},
  {body: "тупяне", question: questions[0]},
  {body: "бубяне", question: questions[0]},
  {body: "поляне", question: questions[0], correct: true},

  {body: "сбор князем дани с подвластных ему земель", question: questions[1], correct: true},
  {body: "собрание княжеской дружины", question: questions[1]},
  {body: "ополчение, состоящее из всех мужчин племени", question: questions[1]},
  {body: "княжеский суд над общинниками", question: questions[1]},

  {body: "крещение Руси", question: questions[2]},
  {body: "походы князя Олега на Византию", question: questions[2]},
  {body: "начало кодификации древнерусских законов", question: questions[2], correct: true},
  {body: "призвание варягов", question: questions[2]},

  {body: "десятина", question: questions[3], correct: true},
  {body: "урок", question: questions[3]},
  {body: "подушная подать", question: questions[3]},
  {body: "пожилое", question: questions[3]},

  #Test: 2
  {body: "жовтий", question: questions[4]},
  {body: "блакитний", question: questions[4]},
  {body: "белый", question: questions[4], correct: true},
  {body: "красный", question: questions[4], correct: true},
  {body: "синий", question: questions[4], correct: true},

  {body: "65", question: questions[5]},
  {body: "85", question: questions[5], correct: true},
  {body: "73", question: questions[5]},
  {body: "91", question: questions[5]},

  {body: "интеграция", question: questions[6]},
  {body: "сепаратизм", question: questions[6], correct: true},
  {body: "глобализация", question: questions[6]},
  {body: "централизация", question: questions[6]},

  {body: "унитарное государство", question: questions[7]},
  {body: "федерация", question: questions[7]},
  {body: "монархия", question: questions[7], correct: true},
  {body: "демократия", question: questions[7]},

  #Test: 3
  {body: "13", question: questions[8]},
  {body: "22", question: questions[8], correct: true},
  {body: "23", question: questions[8]},
  {body: "11", question: questions[8]},

  {body: "1", question: questions[9]},
  {body: "2", question: questions[9]},
  {body: "3", question: questions[9], correct: true},
  {body: "4", question: questions[9]},

  {body: "5", question: questions[10]},
  {body: "9", question: questions[10], correct: true},
  {body: "11", question: questions[10]},
  {body: "19", question: questions[10]},

  {body: "1", question: questions[11], correct: true},
  {body: "2", question: questions[11]},
  {body: "3", question: questions[11]},
  {body: "4", question: questions[11]},

  {body: "32", question: questions[12]},
  {body: "35", question: questions[12]},
  {body: "39", question: questions[12]},
  {body: "46", question: questions[12], correct: true},

  {body: "4", question: questions[13], correct: true},
  {body: "5", question: questions[13]},
  {body: "6", question: questions[13]},
  {body: "7", question: questions[13]}
])

TestPassage.create!([
  {user: users[0], test: tests[1]},
  {user: users[0], test: tests[2]},
  {user: users[1], test: tests[1]},
  {user: users[2], test: tests[0]}
])
