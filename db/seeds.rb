# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create([
  {name: "John Doe", email: "johndoe@mail.ru"},
  {name: "Jane Doe", email: "janedoe@mail.ru"},
  {name: "Harry Potter", email: "harrypotter@mail.ru"}
])


Category.create!([ {title: "История"}, {title: "Обществознание"}])

Test.create!([
  #Test: 1
  {title: "Древняя Русь", level: 1, category_id: 1},
  #Test: 2
  {title: "Территориально-государственное устройство", level: 2, category_id: 2},
  #Test: 3
  {title: "Субьекты РФ", level: 2, category_id: 2}
])


Question.create!([
  #Test: 1
  {body: "Какие племена существовали:", test_id: 1},
  {body: "Что в Древней Руси называлось полюдьем:", test_id: 1},
  {body: "Какое из событий произошло позже всех остальных:", test_id: 1},
  {body: "В Древней Руси налог в пользу церкви назывался:", test_id: 1},

  #Test: 2
  {body: "Какие цвета включает флаг РФ:", test_id: 2},
  {body: "Количество субьектов РФ:", test_id: 2},
  {body: "Стремление нации к отделению называется:", test_id: 2},
  {body: "Что из этого является формой правления:", test_id: 2},

  #Test: 3
  {body: "Количество республик в РФ:", test_id: 3},
  {body: "Количество городов федерального значения:", test_id: 3},
  {body: "Количество краёв:", test_id: 3},
  {body: "Количество автономных областей:", test_id: 3},
  {body: "Количество областей:", test_id: 3},
  {body: "Количество автономных округов:", test_id: 3}
])

Answer.create!([
  #Test: 1
  {body: "древляне", question_id: 1, correct: true},
  {body: "тупяне", question_id: 1},
  {body: "бубяне", question_id: 1},
  {body: "поляне", question_id: 1, correct: true},

  {body: "сбор князем дани с подвластных ему земель", question_id: 2, correct: true},
  {body: "собрание княжеской дружины", question_id: 2},
  {body: "ополчение, состоящее из всех мужчин племени", question_id: 2},
  {body: "княжеский суд над общинниками", question_id: 2},

  {body: "крещение Руси", question_id: 3},
  {body: "походы князя Олега на Византию", question_id: 3},
  {body: "начало кодификации древнерусских законов", question_id: 3, correct: true},
  {body: "призвание варягов", question_id: 3},

  {body: "десятина", question_id: 4, correct: true},
  {body: "урок", question_id: 4},
  {body: "подушная подать", question_id: 4},
  {body: "пожилое", question_id: 4},

  #Test: 2
  {body: "жовтий", question_id: 5},
  {body: "блакитний", question_id: 5},
  {body: "белый", question_id: 5, correct: true},
  {body: "красный", question_id: 5, correct: true},
  {body: "синий", question_id: 5, correct: true},

  {body: "65", question_id: 6},
  {body: "85", question_id: 6, correct: true},
  {body: "73", question_id: 6},
  {body: "91", question_id: 6},

  {body: "интеграция", question_id: 7},
  {body: "сепаратизм", question_id: 7, correct: true},
  {body: "глобализация", question_id: 7},
  {body: "централизация", question_id: 7},

  {body: "унитарное государство", question_id: 8},
  {body: "федерация", question_id: 8},
  {body: "монархия", question_id: 8, correct: true},
  {body: "демократия", question_id: 8},

  #Test: 3
  {body: "13", question_id: 9},
  {body: "22", question_id: 9, correct: true},
  {body: "23", question_id: 9},
  {body: "11", question_id: 9},

  {body: "1", question_id: 10},
  {body: "2", question_id: 10},
  {body: "3", question_id: 10, correct: true},
  {body: "4", question_id: 10},

  {body: "5", question_id: 11},
  {body: "9", question_id: 11, correct: true},
  {body: "11", question_id: 11},
  {body: "19", question_id: 11},

  {body: "1", question_id: 12, correct: true},
  {body: "2", question_id: 12},
  {body: "3", question_id: 12},
  {body: "4", question_id: 12},

  {body: "32", question_id: 13},
  {body: "35", question_id: 13},
  {body: "39", question_id: 13},
  {body: "46", question_id: 13, correct: true},

  {body: "4", question_id: 14, correct: true},
  {body: "5", question_id: 14},
  {body: "6", question_id: 14},
  {body: "7", question_id: 14}
])

TestPassage.create!([
  {user_id: 1, test_id: 2},
  {user_id: 1, test_id: 3},
  {user_id: 2, test_id: 2},
  {user_id: 3, test_id: 1}
])
