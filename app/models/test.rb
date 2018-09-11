class Test < ApplicationRecord
  belongs_to :category
  #Скоуп в этом случае неуместен? Использовать обычный self.метод?
  scope :titles_by_category2, ->(category_title) { self.joins(
    "INNER JOIN categories
    ON categories.id = tests.category_id
    AND categories.title = '#{category_title}'")
    .order(title: :DESC).pluck(:title) }

  def self.titles_by_category(category_title)
    self.joins(
      "INNER JOIN categories
      ON categories.id = tests.category_id
      AND categories.title = '#{category_title}'")
       .order(title: :DESC).pluck(:title)
  end
end
