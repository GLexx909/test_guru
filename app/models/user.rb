class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: "Test", foreign_key: "author_id"

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true,
  format: { with: /.+@.+\..+/i }
  validates :password, presence: true
  validates :password, confirmation: true

  def passed_tests(level)
    self.tests.where("level = :level", level: level).distinct
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end

  def admin?
    is_a?(Admin)
  end
end
