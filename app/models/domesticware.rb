class Domesticware < ActiveRecord::Base
  
  if Rails.env.development?
      has_attached_file :image, IMAGE_PAPERCLIP_STORAGE_OPTS
    else
      has_attached_file :image, styles: {
          main: '1200x'
      }

      # Validate the attached image is image/jpg, image/png, etc
      validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
    end
    
end