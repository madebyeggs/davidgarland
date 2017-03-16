class AddRowOrderToDomesticwares < ActiveRecord::Migration
  def change
    add_column :domesticwares, :row_order, :integer
  end
end
