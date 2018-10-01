class User < ApplicationRecord

  # include Auth

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: "Test", foreign_key: "author_id"

  validates :name, presence: true, on: [:create, :edit]
  validates :email, presence: true, uniqueness: true,
  format: { with: /.+@.+\..+/i }, on: [:create, :edit]
  validates :password, presence: true, if: proc { |user| user.password_digest.blank? }, on: [:create, :edit]
  validates :password, confirmation: true, on: [:create, :edit]

  has_secure_password

  def passed_tests(level)
    self.tests.where("level = :level", level: level).distinct
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end

end
