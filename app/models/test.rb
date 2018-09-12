class Test < ApplicationRecord
  belongs_to :category

  def self.titles_by_category(category_title)
    self.joins(:category).where(categories: {title: category_title}).order(title: :DESC).pluck(:title)
  end
end
