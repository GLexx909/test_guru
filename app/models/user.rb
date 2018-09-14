class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: "Test", foreign_key: "author_id"

  def passed_tests(level)
    self.tests.where("level = :level", level: level).distinct
  end

end
