class Test < ApplicationRecord
  belongs_to :category

  def self.titles(category_name)
    category_id = Category.find_by_title(category_name).id
    tests_title = []
    Test.where(category_id: category_id).order(title: :desc).each do |test|
      tests_title<<test.title
    end
    tests_title
  end
end
