class User < ApplicationRecord
  #Этот метод работает дольше
  def passed_tests1(level)
    TestPassage.where(user_id: self.id).each do |testpass|
      Test.where(id: testpass.test_id, level: level).each {|test| p test}
    end
  end

  #Этот метод быстрее. Какой оставлять? Никакой?)))
  def passed_tests2(level)
    tests = Test.where(level: level)
    TestPassage.where(user_id: self.id).each do |testpass|
      tests.select{|test| test.id == testpass.test_id}.each {|test| p test}
    end
  end

end
