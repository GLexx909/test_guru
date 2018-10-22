class Badge < ApplicationRecord
  has_many :badge_issueds
  has_many :users, through: :badge_issueds
end
