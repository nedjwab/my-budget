class GroupsController < ApplicationController
  before_action :set_group, only: %i[show edit update destroy]
  before_action :update_allowed_parameters, if: :devise_controller?
  before_action :authenticate_user!

  def index
    if current_user
      @groups = current_user.groups
    else
      redirect_to new_user_session_path
    end
  end

  def new
    @group = current_user.groups.new
  end

  def create
    @user = current_user
    @group = @user.groups.create(group_params)
    if @group.save
      flash[:notice] = 'New category created successfully'
      redirect_to groups_path

    else
      flash.now[:alert] = 'Category creation failed'
      render action: 'new'
    end
  end

 
  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    respond_to do |format|
      format.html do
        redirect_to  groups_path, notice: 'group was successfully deleted.'
      end
    end
  end
  private

  def set_group
    @group = Group.find(params[:id])
  end
  
  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
