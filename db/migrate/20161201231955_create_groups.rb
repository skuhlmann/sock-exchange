class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.date :swap_date
      t.string :gift_description

      t.timestamps
    end
  end
end
