class AddRowOrderToDomesticWares < ActiveRecord::Migration
  def change
    add_column :domestic_wares, :row_order, :integer
  end
end
