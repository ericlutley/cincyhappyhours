class Place < ActiveRecord::Base
  has_many :specials, dependent: :destroy, inverse_of: :place
  accepts_nested_attributes_for :specials

  geocoded_by :address
  after_validation :geocode, unless: -> (obj) { obj.latitude.present? && obj.longitude.present? }

  validates :name, presence: true
  validates :address, presence: true

  def self.with_facebook_id(facebook_id)
    where("facebook_id = ? AND facebook_id IS NOT NULL", facebook_id)
  end
end
