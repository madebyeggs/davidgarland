class DomesticWare < ActiveRecord::Base
  has_attached_file :image, styles: { medium: "1200x" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end