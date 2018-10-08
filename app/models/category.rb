# == Schema Information
#
# Table name: categories
#
#  id   :integer          not null, primary key
#  name :string
#

class Category < ApplicationRecord
  has_many :category_associations, dependent: :destroy

  # include ActiveModel::Validations
  # validates_with MyValidator
  scope :ordered, -> { order(:name) }


end
