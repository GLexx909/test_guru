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
    @test = current_user.created_tests.new(test_params)

    if @test.save
      redirect_to admin_tests_path(@test)
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to admin_tests_path(@test)
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path(@test)
  end

  private

  def test_params
    params.permit(:title, :level, :category_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end

end
