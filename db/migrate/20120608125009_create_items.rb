class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.string :image_url
      t.decimal :price

      t.timestamps
    end
  end
end
