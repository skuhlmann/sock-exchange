class GroupsController < ApplicationController

  def show
    @group = Group.find(params[:id])
    @swappers = @group.swappers.order(:name)
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
    group = Group.find(params[:id])

    group.swap_pairs.each do |pair|
      gifter = Swapper.find(pair[0])
      giftee = Swapper.find(pair[1])

      SwapMailer.swap_email(gifter, giftee, group).deliver_now
    end
    
    redirect_to group_path(group)
  end
end