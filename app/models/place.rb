class Place < ActiveRecord::Base
  # Paginates
  paginates_per 5

  # Shortcut to give us places associated with user
  belongs_to :user

  # Enter name for place
  validates :address, :description, :presence => true 
  validates :name, :presence => true, length: { minimum: 3 }
end
