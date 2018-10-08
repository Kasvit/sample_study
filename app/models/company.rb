class Company < ApplicationRecord
  has_many :offices, inverse_of: :company
  accepts_nested_attributes_for :offices, reject_if: :all_blank, allow_destroy: true

  has_one_attached :logo, dependent: :destroy
  validates :title, :description, presence: true
  
end
