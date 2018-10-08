class CreateOffices < ActiveRecord::Migration[5.2]
  def change
    create_table :offices do |t|
      t.integer :company_id
      t.string  :country
      t.string  :address
      t.string  :phone
      t.timestamps
    end
  end
end
