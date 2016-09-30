class AddImageToDomesticware < ActiveRecord::Migration
  def self.up
    add_attachment :domesticwares, :image
  end

  def self.down
    remove_attachment :domesticwares, :image
  end
end
