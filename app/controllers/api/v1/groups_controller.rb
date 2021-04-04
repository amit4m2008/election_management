class Api::V1::GroupsController < Api::ApiController

  def index
    groups = Group.all
    render json: groups
  end

  def create
    group = Group.new(group_params)

    if group.save
      render json: group, status: :created
    else
      render json: group.errors, status: :unprocessable_entity
    end
  end

  protected

  def group_params
    params.require(:group).permit(:name, :description)
  end
end
