class TestsController < ApplicationController

  before_action :authenticate_user!
  before_action :find_test, only: :start
  before_action :redirect_to_admin_path, only: :index

  def index
    @tests = Test.all
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def redirect_to_admin_path
    redirect_to admin_tests_path if current_user.admin?
  end

end
