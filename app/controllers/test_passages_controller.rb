class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :find_test_passage, only: [:show, :update, :result, :gist]

  def show
  end

  def result
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)

      #to give certain Badges to User if test ended successfully
      give_budges if @test_passage.success?

    else
      render :show
    end
  end

  def gist
    question = @test_passage.current_question
    @result = GistQuestionService.new(question).call

    flash_options =
      if @result.success?
        current_user.gists.create!(url: @result.id, question: question)
        {notice: @result.html_url}
      else
        {alert: t('.failure')}
      end

    redirect_to @test_passage, flash_options
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def find_badge(id)
    Badge.find(id)
  end

  def give_budges

    # Giv badge for successfully ended Test with 100% right answers
    badge_any_test = find_badge(1)
    if @test_passage.success_all?
      current_user.badge_issueds.create!(badge: badge_any_test) #Тестовый бадж, будет удалён.
      flash[:notice1] = 'Вы получили награду за правильные ответы на все вопросы.'
    end  

    # Giv badge for successfully ended Test on the first try
    if @test_passage.unique?
      badge_first_att = find_badge(2)
      current_user.badge_issueds.create!(badge: badge_first_att)
      flash[:notice2] = 'Вы получили награду за успешно пройденный тест с первой попытки.'
    end

    # Giv badge for successful completion of all tests of a certain category
    current_category = @test_passage.test.category
    user_tests = current_user.tests.distinct

    if user_tests.where(category: current_category).count == Test.where(category: current_category).count
      badge_first_att = find_badge(3)
      current_user.badge_issueds.create!(badge: badge_first_att)
      flash[:notice3] = 'Вы получили награду за успешное прохождение всех тестов данной категории.'
    end

    # Giv badge for successful completion of all tests of a certain level
    current_level = @test_passage.test.level
    if user_tests.where(level: current_level).count == Test.where(level: current_level).count
      badge_first_att = find_badge(4)
      current_user.badge_issueds.create!(badge: badge_first_att)
      flash[:notice4] = 'Вы получили награду за успешное прохождение всех тестов данного уровня.'
    end

  end













end
