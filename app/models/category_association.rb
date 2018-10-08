# == Schema Information
#
# Table name: category_associations
#
#  id                :integer          not null, primary key
#  category_id       :integer
#  categoriable_id   :integer
#  categoriable_type :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class CategoryAssociation < ApplicationRecord
  belongs_to :categoriable, polymorphic: true
  belongs_to :category

end
