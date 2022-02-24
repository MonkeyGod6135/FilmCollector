class Appearance < ApplicationRecord
  # belongs to method specifies a one to one realtionship
  # actor options specifies that one apperance has one actor
  belongs_to :actor
  # movie option specifies that one apperance has one movie
  belongs_to :movie
  # validates method specifies that an appearance is valid only if both are present
  validates :actor_id, :movie_id, presence: true
end
