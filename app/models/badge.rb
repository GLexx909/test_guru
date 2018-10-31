class Badge < ApplicationRecord
  has_many :badge_issueds, dependent: :destroy
  has_many :users, through: :badge_issueds

  validates :name, presence: true, uniqueness: true
  validates :img, presence: true
  validates :rule_type, presence: true
end
