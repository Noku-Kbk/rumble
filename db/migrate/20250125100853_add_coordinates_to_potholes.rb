class AddCoordinatesToPotholes < ActiveRecord::Migration[7.1]
  def change
    add_column :potholes, :latitude, :float
    add_column :potholes, :longitude, :float
  end
end
