class Picture < ActiveRecord::Base

  has_many :likes, dependent: :destroy
  has_many :reviews, dependent: :destroy

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "200x200>" }, :convert_options => { :thumb => ["-bordercolor grey","-border 3x3"] }, :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end