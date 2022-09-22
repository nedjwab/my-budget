class OperationsController < ApplicationController
  before_action :update_allowed_parameters, if: :devise_controller?
  before_action :authenticate_user!
  def index
    @group = current_user.groups.find(params[:group_id])
    @operations = @group.operations
  end

  def new
    @group = current_user.groups.find(params[:group_id])
    @operation = @group.operations.new
  end

  def create
    @group = current_user.groups.find(params[:group_id])
    @operation = current_user.operations.create(operation_params)
    puts @operation
    if @operation.save
      @group_operation = @operation.group_operations.create(group_id: @group.id, operation_id: @operation.id)
      if @group_operation.save
        flash[:notice] = 'New transaction created successfully'
        redirect_to group_operations_path(@group)
      else
        flash.now[:alert] = 'Transaction category creation failed'
        render action: 'new'
      end
    else
      flash.now[:alert] = 'Transaction creation failed'
      render action: 'new'
    end
  end

  def destroy
    @operation = Operation.find(params[:id])
    @operation.destroy
    respond_to do |format|
      format.html do
        redirect_to  group_operations_url, notice: 'Operation was successfully deleted.'
      end
    end
  end

  private

  def operation_params
    params.require(:operation).permit(:name, :amount)
  end


end
