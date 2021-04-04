class Election < ApplicationRecord
  ## Associations
  belongs_to :group
  has_many :votes

  ## Constants
  CATEGORY = ["College Representative", "President", "Vice President"]
  SORT_OPTIONS = [
    ["popular (more number of votes)", "popular"],
    ["Newest (created by)", "Newest"]
  ]

  ## validations
  validates_presence_of :name, :category, :group_id
end
