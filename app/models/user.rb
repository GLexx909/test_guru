class User < ApplicationRecord

  def passed_test(level)
    Test.joins("INNER JOIN test_passages ON test_passages.test_id = tests.id AND test_passages.user_id = #{self.id}").where("level = ?", level)
  end

end
