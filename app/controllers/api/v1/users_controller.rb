class Api::V1::UsersController < Api::V1::BaseController
  before_action :fetch_user, except: :index

  def index

  end

  def show
    expose @user, serializer: UserSerializer
  rescue ActiveRecord::RecordNotFound
    error! :not_found
  end

  private

  def fetch_user
    @user = User.find(params[:id])
  end
end