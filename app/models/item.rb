# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  title       :string
#  description :string
#  price       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Item < ApplicationRecord
  has_many :category_associations, as: :categoriable, dependent: :destroy
  has_many :categories, through: :category_associations
  has_many :comments, as: :commentable

  scope :ordered, -> { order(:title) }

  validates :title, presence: true

  def self.search(params)
    result = all.order('created_at asc')
    result = result.where('lower(title) like lower(?)', "%#{params[:title]}%") if params[:title].present?
    result = result.joins(:categories).where(categories: { id: params[:category_id] }) if params[:category_id].present?
    result
  end
end
