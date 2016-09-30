class CreateDomesticwares < ActiveRecord::Migration
  def change
    create_table :domesticwares do |t|
      t.text :description1
      t.text :description2

      t.timestamps null: false
    end
  end
end
