class Group < ApplicationRecord
  has_and_belongs_to_many :swappers

  def swapper_list
    swappers.pluck(:id)
  end

  def couples
    swappers.each_with_object([]) do |swapper, ary|
      couple = [swapper.id, swapper.partner_id]
      unless ary.any? { |c| c.reverse == couple  }
        ary << couple
      end
    end
  end
end