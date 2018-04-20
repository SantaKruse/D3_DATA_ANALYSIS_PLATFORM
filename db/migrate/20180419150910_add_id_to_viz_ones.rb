class AddIdToVizOnes < ActiveRecord::Migration[5.0]
  def change
    add_column :viz_ones, :patient_id, :string
  end
end
