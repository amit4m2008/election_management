class Election < ApplicationRecord
  ## Associations
  belongs_to :group
  has_many :votes

  ## Constants
  CATEGORY = ["College Representative", "President", "Vice President"]
  SORT_OPTIONS = [
    ["popular (more number of votes)", "popular"],
    ["Newest (created by)", "newest"]
  ]

  ## validations
  validates_presence_of :name, :category, :group_id

  ## Scopes
  scope :newest, -> { reorder(created_at: :desc) }
  scope :popular, -> { joins(:votes).select("elections.*, count(votes.user_id) as user_vote_count").group("elections.id").order("user_vote_count DESC") }


  ## Instance Methods

  def calculate_user_voted_percentage
    total_group_users = self.group.users.count(:id).to_f
    total_users_voted = self.votes.count(:user_id).to_f

    return ((total_users_voted / total_group_users) * 100)
  end

  def get_eligible_users
    return self.group.users
  end

  ## Class Methods

  def self.search(params)
    elections = self.popular
    return elections if params[:search].blank? && params[:sort].blank?

    if params[:search].present?
      search_text = "%#{params[:search]}%"
      elections = elections.where("name ilike (?) or category ilike (?)", search_text, search_text)
    end

    if params[:sort].present?
      elections.send(params[:sort])
    end
  end
end
