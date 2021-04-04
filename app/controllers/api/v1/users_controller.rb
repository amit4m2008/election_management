class Api::V1::UsersController < Api::ApiController
  before_action :find_group, only: [:create]

  def index
    users = User.all
    render json: users
  end

  def create
    user = User.new(user_params)

    if user.save
      @group.users << user
      render json: user, status: :created
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  protected

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def find_group
    @group = Group.find(params[:user][:group_id])
  end
end
