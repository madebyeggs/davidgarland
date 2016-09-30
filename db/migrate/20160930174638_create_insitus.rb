class CreateInsitus < ActiveRecord::Migration
  def change
    create_table :insitus do |t|
      t.attachment :image

      t.timestamps null: false
    end
  end
end
