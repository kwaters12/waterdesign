class Project < ActiveRecord::Base
  has_attached_file :image,
                    :styles => { :large => "600x600#", :medium => "300x300>", :thumb => "100x100>" },
                    :default_url => "post_missing.png",
                    :storage => :s3
        
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  has_many :documents
  belongs_to :user

end
