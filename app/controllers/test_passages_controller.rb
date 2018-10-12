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
    else
      render :show
    end
  end

  def gist
    @result = GistQuestionService.new(@test_passage.current_question).call

    save_gist_on_db

    flash_options = @result.success? ? {notice: result.git_pull_url} : {alert: t('.failure')} #Эта гадина success не проходит, хотя gist отправляется. И url формируется. Проверено. Выводит alert: .failure

    redirect_to @test_passage, flash_options
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def save_gist_on_db
    Gist.create(url: @result.git_pull_url, user: current_user, question: @test_passage.current_question)
  end

end
