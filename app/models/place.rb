class Place < ActiveRecord::Base
  has_many :specials, dependent: :destroy, inverse_of: :place
  accepts_nested_attributes_for :specials

  geocoded_by :address
  after_validation :geocode#, :if => -> (obj) { obj.address.present? and obj.address_changed? }

  validates :name, presence: true
  validates :address, presence: true
end
