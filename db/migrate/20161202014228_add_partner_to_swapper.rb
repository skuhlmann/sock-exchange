class AddPartnerToSwapper < ActiveRecord::Migration[5.0]
  def change
    add_column :swappers, :partner_id , :integer, :references => "partners"
  end
end
