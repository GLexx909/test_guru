class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :tests, class_name: "Test", foreign_key: "author_id"

  def passed_test(level)
    Test.joins(:test_passages).where("level = ?", level).distinct
  end

  def created_tests
    Test.where(author_id: self.id)
  end
end
