class CreateGroupsSwappers < ActiveRecord::Migration[5.0]
  def change
    create_table :groups_swappers do |t|
      t.belongs_to :group, index: true
      t.belongs_to :swapper, index: true
    end
  end
end
