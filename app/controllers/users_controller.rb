class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  def home;end


  # GET /users or /users.json
  def index
    redirect_to groups_path if user_signed_in?
  end

  def create; end
  def show; end

  def set_user
    @user = User.find(params[:id])
  end
end
