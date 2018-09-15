class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :correct_count, on: :create

  scope :right, -> {where(correct: true)}


  private

  def correct_count
    question_id = self.question.id
    answers_correct_count = Answer.where(question_id: question_id, correct: true).count
    message = "Количество правильных ответов не должно привышать 4"
    errors.add(:correct_count, message)if answers_correct_count == 4
  end
end
