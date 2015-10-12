class Place < ActiveRecord::Base
  # Paginates
  paginates_per 5

  # Shortcut to give us places associated with user
  belongs_to :user

  # Enter name for place
  validates :name, :presence => true
end
