class AddFieldsToVizOne < ActiveRecord::Migration[5.0]
  def change
  	add_column :viz_ones, :age, :integer
  	add_column :viz_ones, :hba1c, :decimal
  	add_column :viz_ones, :chol, :decimal
  	add_column :viz_ones, :egfr, :decimal
  	add_column :viz_ones, :bmi, :decimal
  	add_column :viz_ones, :bp, :decimal
  	remove_column :viz_ones, :measure
  	remove_column :viz_ones, :measure_result
  end
end
