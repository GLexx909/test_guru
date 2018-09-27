class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_save :before_save_set_next_question

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def correct_percent
    (100.to_f/test.questions.count)*correct_questions
  end

  def questions_counter
    test.questions.index(current_question) + 1
  end

  def good_result
    correct_percent > 84
  end

  private

  def before_save_set_next_question
    if current_question.nil?
      self.current_question = test.questions.first if test.present?
    else
      next_question = test.questions.order(:id).where('id > ?', current_question.id).first
      self.current_question = next_question
    end

  end

  def correct_answer?(answer_ids)
    answer_ids.nil? ? false : correct_answers.pluck(:id).sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

end
