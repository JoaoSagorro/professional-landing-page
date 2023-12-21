class CreateResources < ActiveRecord::Migration[7.1]
  def change
    create_table :resources do |t|
      t.string :title
      t.string :category
      t.string :link
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
