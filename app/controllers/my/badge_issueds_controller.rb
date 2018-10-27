class My::BadgeIssuedsController < ApplicationController

  def index
    @badge_issueds = current_user.badge_issueds.order(created_at: :desc)
  end

end
