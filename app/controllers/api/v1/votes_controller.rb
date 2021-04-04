class Api::V1::VotesController < Api::ApiController
  def index
    votes = Vote.all
    render json: votes
  end

  def create
    vote = Vote.new(vote_params)

    if vote.save
      render json: vote, status: :created
    else
      render json: vote.errors, status: :unprocessable_entity
    end
  end

  protected

  def vote_params
    params.require(:vote).permit(:user_id, :election_id)
  end
end
