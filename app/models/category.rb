class Category < ActiveRecord::Base
	validates :name, presence: true

	has_attached_file :image, styles: {
	  thumbnail: '250x250>',
	  normal: '640x640>',
	  large: '800x800>',
	  xlarge: '1280x1280>'
	}
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end