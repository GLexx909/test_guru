class Test < ApplicationRecord
  belongs_to :category
  has_many :questions, dependent: :destroy
  has_many :test_passages
  has_many :users, through: :test_passages
  #belongs_to :users выдаёт ошибку. Не могу понять почему. Прописывал и class_name и foreign_key. Но такая же связь должна быть. Без неё всё работает.

  def self.titles_by_category(category_title)
    self.joins(:category).where(categories: {title: category_title}).order(title: :DESC).pluck(:title)
  end
end
