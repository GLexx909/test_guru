class User < ApplicationRecord

  def passed_test(level)
    Test.joins("INNER JOIN test_passages").where(test_passages: {user_id: self.id}).where("level = ?", level).distinct
  end
end
