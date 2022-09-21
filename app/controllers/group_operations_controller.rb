class GroupOperationsController < ApplicationController
  before_action :set_group_operation, only: %i[show edit update destroy]
  before_action :update_allowed_parameters, if: :devise_controller?
  before_action :authenticate_user!
  # GET /group_operations or /group_operations.json
  def index
    @group_operations = GroupOperation.all
  end

  # GET /group_operations/1 or /group_operations/1.json
  def show; end

  # GET /group_operations/new
  def new
    @group_operation = GroupOperation.new
    @user = current_user.name
  end

  # GET /group_operations/1/edit
  def edit; end

  # POST /group_operations or /group_operations.json
  def create
    @group_operation = GroupOperation.new(group_operation_params)

    respond_to do |format|
      if @group_operation.save
        format.html { redirect_to group_operation_url(@group_operation), notice: 'Group operation was successfully created.' }
        format.json { render :show, status: :created, location: @group_operation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group_operation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /group_operations/1 or /group_operations/1.json
  def update
    respond_to do |format|
      if @group_operation.update(group_operation_params)
        format.html { redirect_to group_operation_url(@group_operation), notice: 'Group operation was successfully updated.' }
        format.json { render :show, status: :ok, location: @group_operation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group_operation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_operations/1 or /group_operations/1.json
  def destroy
    @group_operation.destroy

    respond_to do |format|
      format.html { redirect_to group_operations_url, notice: 'Group operation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_group_operation
    @group_operation = GroupOperation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def group_operation_params
    params.require(:group_operation).permit(:group_id, :operation_id)
  end
end
