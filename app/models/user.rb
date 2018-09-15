class User < ApplicationRecord
  #А куда в рельсах Регулярку принято выносить с модели?
  EMAIL_FORMAT = /\A(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})\z/i
  NAME_FORMAT = /\A[A-Z][a-z]{1,}\s?([A-Z][a-z]{1,})?\z|\A[А-Я][а-я]{1,}\s?([А-Я][а-я]{1,})?\z/

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: "Test", foreign_key: "author_id"

  validates :name, presence: true, format: {with: NAME_FORMAT}
  validates :email, presence: true, uniqueness: true,
  format: { with: EMAIL_FORMAT }

  def passed_tests(level)
    self.tests.where("level = :level", level: level).distinct
  end

end
