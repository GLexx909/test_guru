class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author , class_name: "User"
  has_many :questions, dependent: :destroy
  has_many :test_passages
  has_many :users, through: :test_passages

  validates :title, presence: true
  validates :level, numericality: {
    only_integer: true, greater_than_or_equal_to: 0 }
  validate :level_and_title_unique, on: :create

  scope :easy, -> { where(level: 0..1) }
  scope :averages, -> { where(level: 2..4) }
  scope :difficult, -> { where(level: 5..Float::INFINITY) }

  scope :by_category, -> (category_title) {
    joins(:category)
    .where(categories: { title: category_title }).order(title: :desc)
  }

  def self.titles_by_category(category_title)
    by_category(category_title).pluck(:title)
  end

  private

  def level_and_title_unique
    message = "Тест не уникален. Название и уровень совпадают с уже имеющимся."
    test_not_unique = Test.where(level: self.level, title: self.title).any?
    errors.add(:level_and_title_unique, message) if test_not_unique
  end

end
