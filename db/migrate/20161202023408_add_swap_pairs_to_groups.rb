class AddSwapPairsToGroups < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :swap_pairs, :string, array: true, default: []
  end
end
