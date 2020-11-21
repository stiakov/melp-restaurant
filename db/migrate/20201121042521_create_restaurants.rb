class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants, id: :uuid do |t|
      t.integer :rating
      t.text :name
      t.text :site
      t.text :email
      t.text :phone
      t.text :street
      t.text :city
      t.text :state
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end
end
