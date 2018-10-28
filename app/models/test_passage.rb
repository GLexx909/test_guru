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
    test.questions.where('id <= ?', current_question.id).count
  end

  def success?
    correct_percent > 84
  end

  def success_all?
    correct_percent == 100
  end

  private

  def before_save_set_next_question
    self.current_question = next_question
  end

  def next_question
    if current_question.nil?
      test.questions.first if test.present?
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end

  def correct_answer?(answer_ids)
    correct_answers.pluck(:id).sort == answer_ids.to_a.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

end
