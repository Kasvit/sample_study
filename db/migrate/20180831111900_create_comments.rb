class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string  :name
      t.integer :comentable_id
      t.string  :comentable_type
      t.timestamps
    end

    add_index :comments, [:comentable_id, :comentable_type]
  end
end
