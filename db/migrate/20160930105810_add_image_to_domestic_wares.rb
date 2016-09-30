class AddImageToDomesticWares < ActiveRecord::Migration
  def up
    add_attachment :domestic_wares, :image
  end

  def down
    remove_attachment :domestic_wares, :image
  end
end
