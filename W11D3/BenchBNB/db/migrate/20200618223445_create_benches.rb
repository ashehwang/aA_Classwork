class CreateBenches < ActiveRecord::Migration[5.2]
  def change
    create_table :benches do |t|
      t.string :description, null: false
      t.float :lng
      t.float :lat
      t.string :picture_url
      t.timestamps
    end
  end
end
