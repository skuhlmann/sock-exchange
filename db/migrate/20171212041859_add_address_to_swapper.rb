class AddAddressToSwapper < ActiveRecord::Migration[5.0]
  def change
    add_column :swappers, :address, :string
  end
end
