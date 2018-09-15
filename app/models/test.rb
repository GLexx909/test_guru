class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author , class_name: "User"
  has_many :questions, dependent: :destroy
  has_many :test_passages
  has_many :users, through: :test_passages

  validates :title, presence: true, if: :level_and_title_unique?
  validates :level, numericality: {
    only_integer: true, greater_than_or_equal_to: 0},
    allow_nil: true


  scope :easy, -> {where(level: 0..1)}
  scope :averages, -> {where(level: 2..4)}
  scope :difficult, -> {where(level: 5..Float::INFINITY)}

  scope :tbc, -> (category_title) {
    joins(:category)
    .where(categories: {title: category_title}).order(title: :desc).pluck(:title)
  }

  private

  #Не работает((( Даже если просто false оставить.
  def level_and_title_unique?
    false if Test.where(level: self.level, title: self.title).any?
  end

end
