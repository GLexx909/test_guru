class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :answers_count, on: :create

  scope :correct, -> { where(correct: true) }


  private

  def answers_count
    message = "Количество ответов не должно превышать 4"
    errors.add(:answer_count, message) if question.answers.count >= 4
  end
end
