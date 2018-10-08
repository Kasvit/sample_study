class CreateCategoriesAssociations < ActiveRecord::Migration[5.2]
  def change
    create_table :category_associations do |t|
      t.integer :category_id, index: true
      t.integer :categoriable_id
      t.string  :categoriable_type
      t.timestamps
    end
    add_index :category_associations, [:categoriable_id, :categoriable_type], name: "category_association_index"
  end
end
