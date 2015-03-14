class Listing < ActiveRecord::Base
  validates :subcategory_id, presence: true
  validates :price, presence: true, numericality: {greater_than: 0}, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }
  validates :name, presence: true, length: {maximum: 140}
  validates :description, presence: true, length: {minimum: 100}
  validates :processing_time, presence: true
  validates_presence_of :images
  
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :user
  belongs_to :category
  belongs_to :subcategory
  belongs_to :location

  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, :reject_if => lambda { |t| t['photo'].nil? }, :allow_destroy => true

  SHIPPING_SELECT = ['1 Business Day', '1-2 Business Days', '1-3 Business Days', '3-5 Business Days', '1-2 Weeks', '2-3 Weeks', '3-4 Weeks', '4-6 Weeks', '6-8 Weeks', 'More than 8 Weeks']

end
