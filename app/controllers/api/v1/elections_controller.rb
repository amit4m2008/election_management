class Api::V1::ElectionsController < Api::ApiController
  def index
    elections = Election.all
    render json: elections
  end

  def create
    election = Election.new(election_params)

    if election.save
      render json: election, status: :created
    else
      render json: election.errors, status: :unprocessable_entity
    end
  end

  protected

  def election_params
    params.require(:election).permit(:name, :category, :group_id)
  end
end
