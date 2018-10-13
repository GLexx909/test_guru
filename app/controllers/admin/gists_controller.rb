class Admin::GistsController < Admin::BaseController
  before_action :set_gist, only: [:show, :edit, :update, :destroy]

  def index
    @gists = Gist.all
  end

end
