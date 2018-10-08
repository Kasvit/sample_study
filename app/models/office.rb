class Office < ApplicationRecord
  belongs_to :company

  validates :address, :country, presence: true

end
