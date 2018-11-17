class AddParentToSwapper < ActiveRecord::Migration[5.0]
  def change
    add_column :swappers, :child_id , :integer, :references => "child"
  end
end
