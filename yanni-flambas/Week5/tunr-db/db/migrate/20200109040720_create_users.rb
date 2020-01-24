class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.text :name
      t.text :email
      t.text :image
      t.text :bio

      t.timestamps
    end
  end
end
