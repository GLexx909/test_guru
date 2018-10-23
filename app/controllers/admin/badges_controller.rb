class Admin::BadgesController < Admin::BaseController

  before_action :find_badges, only: :index
  before_action :find_badge, only: %i[show edit update]

  def index
  end

  def show
  end

  def edit
  end

  def update
    if @badge.update(badge_params)
      redirect_to [:admin, @badge]
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def badge_params
    params.require(:badge).permit(:name, :img)
  end

  def find_badges
    @badges = Badge.all
  end

  def find_badge
    @badge = Badge.find(params[:id])
  end

end
