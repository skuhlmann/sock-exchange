class SwappersController < ApplicationController

  def edit
    @group = Group.find(params[:group_id])
    @swappers = @group.swappers.order(:name)
    @swapper = Swapper.find(params[:id])
  end

  def create
    group = Group.find(params[:group_id])
    swapper = Swapper.create(swapper_params)
    swapper.groups << group

    if swapper_params[:partner_id] != ""
      update_partner(swapper)
    end

    redirect_to group_path(group)
  end

  def update
    group = Group.find(params[:group_id])
    swapper = Swapper.find(params[:id])
    swapper.update(swapper_params)

    if swapper_params[:partner_id] != ""
      update_partner(swapper)
    end

    redirect_to group_path(group)
  end

  private

  def swapper_params
    params.require(:swapper).permit(:name, :email, :partner_id, :address, :child_id)
  end

  def update_partner(swapper)
    partner = Swapper.find(swapper_params[:partner_id])

    partner.partner_id = swapper.id
    partner.save
  end
end