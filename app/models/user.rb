class User < ApplicationRecord
  #А куда в рельсах Регулярку принято выносить с модели?
  EMAIL_FORMAT = /.+@.+\..+/i

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: "Test", foreign_key: "author_id"

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true,
  format: { with: EMAIL_FORMAT }

  def passed_tests(level)
    self.tests.where("level = :level", level: level).distinct
  end

end
