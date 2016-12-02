class GroupsController < ApplicationController

  def show
    @group = Group.find(params[:id])
    @group.swappers
    @swapper = Swapper.new
  end
end
