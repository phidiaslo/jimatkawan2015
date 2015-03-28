class Shop < ActiveRecord::Base
  extend FriendlyId
  friendly_id :subdomain, use: :slugged
  
  before_validation :downcase_subdomain

  validates :subdomain, presence: true,
                       uniqueness: { case_insensitive: false },
                       format: { with: /\A[\w\-]+\Z/i, message: 'contains invalid characters' }

  belongs_to :user

  has_attached_file :cover, :styles => { :medium => "783x103>" }
  validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/

  private
  def downcase_subdomain
	self.subdomain = subdomain.try(:downcase)
  end
end
