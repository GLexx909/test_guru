class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :test_passages
  has_many :users, through: :test_passages

  def self.titles_by_category(category_title)
    self.joins(:category).where(categories: {title: category_title}).order(title: :DESC).pluck(:title)
  end
end
