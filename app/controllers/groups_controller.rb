class GroupsController < ApplicationController

  def show
    @group = Group.find(params[:id])
    @group.swappers
    @swapper = Swapper.new
  end

  def scramble
    group = Group.find(params[:id])

    scrambler = Scrambler.new(group.swapper_list, group.couples)
    scrambler.couple_rigged_scramble

    group.swap_pairs = scrambler.swappers.to_a
    group.save

    redirect_to group_path(group)
  end

  def email_blast
    binding.pry
    
    redirect_to group_path(group)
  end
end