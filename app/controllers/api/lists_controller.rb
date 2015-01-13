class Api::ListsController < Api::BaseController
  before_action :check_user, only: [:show, :update, :destroy]

  def index
    render json: current_user.lists
  end

  def show
    render json: list
  end

  def new
    list = List.new
    render json: list
  end

  def create
    list = current_user.lists.create!(safe_params)
    render json: list
  end

  def update
    list.update_attributes(safe_params)
    render nothing: true
  end

  def destroy
    list.destroy
    render nothing: true
  end

  private
  def check_user
    permission_denied if current_user != list.user
  end

  def list
    @list ||= List.find(params[:id])
  end

  def safe_params
    params.require(:list).permit(:content)
  end
end
