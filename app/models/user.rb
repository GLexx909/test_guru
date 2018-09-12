class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages

  def passed_test(level)
    Test.joins(:test_passages).where(test_passages: {user_id: self.id}).where("level = ?", level).distinct
  end
end
