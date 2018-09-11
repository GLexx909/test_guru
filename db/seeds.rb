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
user1 = users[0].id
user2 = users[1].id
user3 = users[2].id

category = Category.create!([ {title: "История"}, {title: "Обществознание"}])
id_history = category[0].id
id_social = category[1].id

tests = Test.create!([
  #Test: 1
  {title: "Древняя Русь", level: 1, category_id: id_history},
  #Test: 2
  {title: "Территориально-государственное устройство", level: 2, category_id: id_social},
  #Test: 3
  {title: "Субьекты РФ", level: 2, category_id: id_social}
])

id_test1 = tests[0].id
id_test2 = tests[1].id
id_test3 = tests[2].id

questions = Question.create!([
  #Test: 1
  {body: "Какие племена существовали:", test_id: id_test1},
  {body: "Что в Древней Руси называлось полюдьем:", test_id: id_test1},
  {body: "Какое из событий произошло позже всех остальных:", test_id: id_test1},
  {body: "В Древней Руси налог в пользу церкви назывался:", test_id: id_test1},

  #Test: 2
  {body: "Какие цвета включает флаг РФ:", test_id: id_test2},
  {body: "Количество субьектов РФ:", test_id: id_test2},
  {body: "Стремление нации к отделению называется:", test_id: id_test2},
  {body: "Что из этого является формой правления:", test_id: id_test2},

  #Test: 3
  {body: "Количество республик в РФ:", test_id: id_test3},
  {body: "Количество городов федерального значения:", test_id: id_test3},
  {body: "Количество краёв:", test_id: id_test3},
  {body: "Количество автономных областей:", test_id: id_test3},
  {body: "Количество областей:", test_id: id_test3},
  {body: "Количество автономных округов:", test_id: id_test3}
])

id_question1  = questions[0].id
id_question2  = questions[1].id
id_question3  = questions[2].id
id_question4  = questions[3].id

id_question5  = questions[4].id
id_question6  = questions[5].id
id_question7  = questions[6].id
id_question8  = questions[7].id

id_question9  = questions[8].id
id_question10 = questions[9].id
id_question11 = questions[10].id
id_question12 = questions[11].id
id_question13 = questions[12].id
id_question14 = questions[13].id

Answer.create!([
  #Test: 1
  {body: "древляне", question_id: id_question1, correct: true},
  {body: "тупяне", question_id: id_question1},
  {body: "бубяне", question_id: id_question1},
  {body: "поляне", question_id: id_question1, correct: true},

  {body: "сбор князем дани с подвластных ему земель", question_id: id_question2, correct: true},
  {body: "собрание княжеской дружины", question_id: id_question2},
  {body: "ополчение, состоящее из всех мужчин племени", question_id: id_question2},
  {body: "княжеский суд над общинниками", question_id: id_question2},

  {body: "крещение Руси", question_id: id_question3},
  {body: "походы князя Олега на Византию", question_id: id_question3},
  {body: "начало кодификации древнерусских законов", question_id: id_question3, correct: true},
  {body: "призвание варягов", question_id: id_question3},

  {body: "десятина", question_id: id_question4, correct: true},
  {body: "урок", question_id: id_question4},
  {body: "подушная подать", question_id: id_question4},
  {body: "пожилое", question_id: id_question4},

  #Test: 2
  {body: "жовтий", question_id: id_question5},
  {body: "блакитний", question_id: id_question5},
  {body: "белый", question_id: id_question5, correct: true},
  {body: "красный", question_id: id_question5, correct: true},
  {body: "синий", question_id: id_question5, correct: true},

  {body: "65", question_id: id_question6},
  {body: "85", question_id: id_question6, correct: true},
  {body: "73", question_id: id_question6},
  {body: "91", question_id: id_question6},

  {body: "интеграция", question_id: id_question7},
  {body: "сепаратизм", question_id: id_question7, correct: true},
  {body: "глобализация", question_id: id_question7},
  {body: "централизация", question_id: id_question7},

  {body: "унитарное государство", question_id: id_question8},
  {body: "федерация", question_id: id_question8},
  {body: "монархия", question_id: id_question8, correct: true},
  {body: "демократия", question_id: id_question8},

  #Test: 3
  {body: "13", question_id: id_question9},
  {body: "22", question_id: id_question9, correct: true},
  {body: "23", question_id: id_question9},
  {body: "11", question_id: id_question9},

  {body: "1", question_id: id_question10},
  {body: "2", question_id: id_question10},
  {body: "3", question_id: id_question10, correct: true},
  {body: "4", question_id: id_question10},

  {body: "5", question_id: id_question11},
  {body: "9", question_id: id_question11, correct: true},
  {body: "11", question_id: id_question11},
  {body: "19", question_id: id_question11},

  {body: "1", question_id: id_question12, correct: true},
  {body: "2", question_id: id_question12},
  {body: "3", question_id: id_question12},
  {body: "4", question_id: id_question12},

  {body: "32", question_id: id_question13},
  {body: "35", question_id: id_question13},
  {body: "39", question_id: id_question13},
  {body: "46", question_id: id_question13, correct: true},

  {body: "4", question_id: id_question14, correct: true},
  {body: "5", question_id: id_question14},
  {body: "6", question_id: id_question14},
  {body: "7", question_id: id_question14}
])

TestPassage.create!([
  {user_id: user1, test_id: id_test2},
  {user_id: user1, test_id: id_test3},
  {user_id: user1, test_id: id_test1},
  {user_id: user2, test_id: id_test2},
  {user_id: user3, test_id: id_test1}
])
