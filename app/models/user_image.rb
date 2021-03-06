class UserImage < ActiveRecord::Base

  validates_uniqueness_of :image_file_name

  # see paperclip docs http://rdoc.info/github/thoughtbot/paperclip/master/Paperclip/ClassMethods:has_attached_file
  has_attached_file :image,
    :path => ":rails_root/user_images/:id/:filename",
    :url  => "/images/:filename"
  
end
