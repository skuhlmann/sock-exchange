class SwappersController < ApplicationController

  def edit
    @group = Group.find(params[:group_id])
    @swapper = Swapper.find(params[:id])
  end

  def create
    group = Group.find(params[:group_id])
    swapper = Swapper.create(swapper_params)
    swapper.groups << group

    redirect_to group_path(group)
  end

  def update
    group = Group.find(params[:group_id])
    swapper = Swapper.find(params[:id])
    swapper.update(swapper_params)

    redirect_to group_path(group)
  end

  private

  def swapper_params
    params.require(:swapper).permit(:name, :email)
  end
end