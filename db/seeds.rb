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
  {title: "Древняя Русь", level: 1, category_id: category[0].id, author_id: users[0]},
  #Test: 2
  {title: "Территориально-государственное устройство", level: 2, category_id: category[1].id, author_id: users[0]},
  #Test: 3
  {title: "Субьекты РФ", level: 2, category_id: category[1].id, author_id: users[1]}
])

questions = Question.create!([
  #Test: 1
  {body: "Какие племена существовали:", test_id: tests[0].id},
  {body: "Что в Древней Руси называлось полюдьем:", test_id: tests[0].id},
  {body: "Какое из событий произошло позже всех остальных:", test_id: tests[0].id},
  {body: "В Древней Руси налог в пользу церкви назывался:", test_id: tests[0].id},

  #Test: 2
  {body: "Какие цвета включает флаг РФ:", test_id: tests[1].id},
  {body: "Количество субьектов РФ:", test_id: tests[1].id},
  {body: "Стремление нации к отделению называется:", test_id: tests[1].id},
  {body: "Что из этого является формой правления:", test_id: tests[1].id},

  #Test: 3
  {body: "Количество республик в РФ:", test_id: tests[2].id},
  {body: "Количество городов федерального значения:", test_id: tests[2].id},
  {body: "Количество краёв:", test_id: tests[2].id},
  {body: "Количество автономных областей:", test_id: tests[2].id},
  {body: "Количество областей:", test_id: tests[2].id},
  {body: "Количество автономных округов:", test_id: tests[2].id}
])

Answer.create!([
  #Test: 1
  {body: "древляне", question_id: questions[0].id, correct: true},
  {body: "тупяне", question_id: questions[0].id},
  {body: "бубяне", question_id: questions[0].id},
  {body: "поляне", question_id: questions[0].id, correct: true},

  {body: "сбор князем дани с подвластных ему земель", question_id: questions[1].id, correct: true},
  {body: "собрание княжеской дружины", question_id: questions[1].id},
  {body: "ополчение, состоящее из всех мужчин племени", question_id: questions[1].id},
  {body: "княжеский суд над общинниками", question_id: questions[1].id},

  {body: "крещение Руси", question_id: questions[2].id},
  {body: "походы князя Олега на Византию", question_id: questions[2].id},
  {body: "начало кодификации древнерусских законов", question_id: questions[2].id, correct: true},
  {body: "призвание варягов", question_id: questions[2].id},

  {body: "десятина", question_id: questions[3].id, correct: true},
  {body: "урок", question_id: questions[3].id},
  {body: "подушная подать", question_id: questions[3].id},
  {body: "пожилое", question_id: questions[3].id},

  #Test: 2
  {body: "жовтий", question_id: questions[4].id},
  {body: "блакитний", question_id: questions[4].id},
  {body: "белый", question_id: questions[4].id, correct: true},
  {body: "красный", question_id: questions[4].id, correct: true},
  {body: "синий", question_id: questions[4].id, correct: true},

  {body: "65", question_id: questions[5].id},
  {body: "85", question_id: questions[5].id, correct: true},
  {body: "73", question_id: questions[5].id},
  {body: "91", question_id: questions[5].id},

  {body: "интеграция", question_id: questions[6].id},
  {body: "сепаратизм", question_id: questions[6].id, correct: true},
  {body: "глобализация", question_id: questions[6].id},
  {body: "централизация", question_id: questions[6].id},

  {body: "унитарное государство", question_id: questions[7].id},
  {body: "федерация", question_id: questions[7].id},
  {body: "монархия", question_id: questions[7].id, correct: true},
  {body: "демократия", question_id: questions[7].id},

  #Test: 3
  {body: "13", question_id: questions[8].id},
  {body: "22", question_id: questions[8].id, correct: true},
  {body: "23", question_id: questions[8].id},
  {body: "11", question_id: questions[8].id},

  {body: "1", question_id: questions[9].id},
  {body: "2", question_id: questions[9].id},
  {body: "3", question_id: questions[9].id, correct: true},
  {body: "4", question_id: questions[9].id},

  {body: "5", question_id: questions[10].id},
  {body: "9", question_id: questions[10].id, correct: true},
  {body: "11", question_id: questions[10].id},
  {body: "19", question_id: questions[10].id},

  {body: "1", question_id: questions[11].id, correct: true},
  {body: "2", question_id: questions[11].id},
  {body: "3", question_id: questions[11].id},
  {body: "4", question_id: questions[11].id},

  {body: "32", question_id: questions[12].id},
  {body: "35", question_id: questions[12].id},
  {body: "39", question_id: questions[12].id},
  {body: "46", question_id: questions[12].id, correct: true},

  {body: "4", question_id: questions[13].id, correct: true},
  {body: "5", question_id: questions[13].id},
  {body: "6", question_id: questions[13].id},
  {body: "7", question_id: questions[13].id}
])

TestPassage.create!([
  {user_id: users[0].id, test_id: tests[1].id},
  {user_id: users[0].id, test_id: tests[2].id},
  {user_id: users[0].id, test_id: tests[0].id},
  {user_id: users[1].id, test_id: tests[1].id},
  {user_id: users[2].id, test_id: tests[0].id}
])
