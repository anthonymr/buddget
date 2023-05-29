class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @groups = current_user.groups
  end

  def show
    @group = current_user.groups.includes(:payments).find(params[:id])
    @group_payments = @group.payments.order(created_at: :desc)
  end

  def new
    @group = current_user.groups.new
  end

  def create
    @group = current_user.groups.new(group_params)

    if @group.save
      redirect_to groups_path, notice: 'Group was successfully created.'
    else
      render :new, alert: 'Group was not created.'
    end
  end

  def edit
    @group = current_group
  end

  def update
    if current_group.update(group_params)
      redirect_to groups_path, notice: 'Group was successfully updated.'
    else
      render :edit, alert: 'Group was not updated.'
    end
  end

  def destroy
    if current_group.destroy
      redirect_to groups_path, notice: 'Group was successfully destroyed.'
    else
      redirect_to groups_path, alert: 'Group was not destroyed.'
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon, :author_id)
  end

  def current_group
    current_user.groups.find(params[:id])
  end
end
