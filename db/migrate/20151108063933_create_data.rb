class CreateData < ActiveRecord::Migration
  def change
    create_table :data do |t|
      t.string :href
      t.string :title
      t.string :author
      t.string :create

      t.integer :category
      t.integer :state


      t.timestamps null: false
    end
  end
end
