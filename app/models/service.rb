# == Schema Information
#
# Table name: services
#
#  id          :integer          not null, primary key
#  title       :string
#  description :string
#  price       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Service < ApplicationRecord
  has_many :category_associations, as: :categoriable, dependent: :destroy
  has_many :categories, through: :category_associations
  has_many :comments, as: :commentable
  
  scope :ordered, -> { order(:title) }

  validates :title, presence: true
end
