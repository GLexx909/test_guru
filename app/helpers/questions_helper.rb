module QuestionsHelper
  def question_header(path, question)
    if path.end_with?('new')
      "Create New #{question.test.title} Question"
    else
      "Edit #{question.test.title} Question"
    end
  end
end
