class CreateStudioceramics < ActiveRecord::Migration
  def change
    create_table :studioceramics do |t|
      t.text :description1
      t.text :description2
      t.attachment :image

      t.timestamps null: false
    end
  end
end
