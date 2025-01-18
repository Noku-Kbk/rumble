class CreatePotholes < ActiveRecord::Migration[7.1]
  def change
    create_table :potholes do |t|
      t.string :address
      t.string :size
      t.text :description
      t.string :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
