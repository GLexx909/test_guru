class Admin::TestsController < Admin::BaseController

  before_action :find_test, only: [:show, :update, :destroy, :start]

  def index
    @tests = Test.all
  end

  def show
  end

  def new
    @test = current_user.tests.new
  end

  def create
    @test = current_user.tests.new(test_params) #Тест не видит автора не поэтому (хотя тут не правильно написано. current_user.tests автора не даёт. Тут дефолт может прописывать надо в params ? )

    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to test_path
  end

  private

  def test_params
    params = ActionController::Parameters.new(test: { author: current_user })
    params.permit(:title, :level, :category_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end

end
