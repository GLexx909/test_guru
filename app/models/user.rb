require 'digest/sha1'

class User < ApplicationRecord

  # include Auth

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: "Test", foreign_key: "author_id"

  has_secure_password

  def passed_tests(level)
    self.tests.where("level = :level", level: level).distinct
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end

end
