class Insitu < ActiveRecord::Base
  
  if Rails.env.development?
      has_attached_file :image, IMAGE_PAPERCLIP_STORAGE_OPTS
    else
      has_attached_file :image,
      :convert_options => { :all => '-quality 92' }, 
      styles: {main: '1200x'},
      :storage => :s3,
      :s3_credentials => {
      :access_key_id => ENV['S3_KEY'],
      :secret_access_key => ENV['S3_SECRET'] },
      :url => ':s3_alias_url',
      :s3_host_alias => 'd3sk2yopf63gjr.cloudfront.net', 
      :bucket => 'david-garland',
      :path => "insitus/images/:id_partition/:style/:filename"
    end

    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  
end
