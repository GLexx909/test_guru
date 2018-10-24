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

  def give_budges
    @badge_present = false
    BadgeService.new.select_the_badges(@test_passage, current_user).each do |badge|
      if badge.present?
        current_user.badge_issueds.create!(badge: badge)
        @badge_present = true
      end
    end

    if @badge_present
      flash[:notice] = 'Вы получили новые награды!'
    end
  end













end
