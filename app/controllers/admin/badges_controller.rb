class Admin::BadgesController < Admin::BaseController

  before_action :find_badges, only: :index
  before_action :find_badge, only: :show

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def find_badges
    @badges = Badge.all
  end

  def find_badge
    @badge = Badge.find(params[:id])
  end

end
