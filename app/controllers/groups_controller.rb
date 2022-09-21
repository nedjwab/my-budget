class GroupsController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]

  def index
    @groups = current_user.groups if user_signed_in?
  end

  def new
    @group = current_user.groups.new
  end

  def create
    @user = current_user
    @group = @user.groups.create(group_params)
    if @group.save
      flash[:notice] = 'New category created successfully'
      redirect_to groups_index_path

    else
      flash.now[:alert] = 'Category creation failed'
      render action: 'new'
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
