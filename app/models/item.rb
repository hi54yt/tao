class Item < ActiveRecord::Base
  attr_accessible :image_url, :price, :title, :excerpt_image
  # validates :title, :presence => true
  # validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  belongs_to :user
  has_attached_file :excerpt_image,
                    :url => "/images/:attachment/:id_:style.:extension",
                    :path => ":rails_root/public/images/:attachment/:id_:style.:extension",
                    :styles => { :medium => "600>", :thumb => "300x300#" }
end