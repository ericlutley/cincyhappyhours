class Place < ActiveRecord::Base
  has_many :specials, dependent: :destroy, inverse_of: :place

  geocoded_by :address
  after_validation :geocode, unless: -> (obj) { obj.latitude.present? && obj.longitude.present? }

  validates :name, presence: true
  validates :address, presence: true

  def self.with_external_id(external_id)
    where("external_id = ? AND external_id IS NOT NULL", external_id)
  end
end
