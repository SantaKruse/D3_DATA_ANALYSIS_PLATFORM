class AddFieldsToViz1 < ActiveRecord::Migration[5.0]
  def change
  	add_column :viz1s, :measure, :string
  	add_column :viz1s, :year, :integer
  	add_column :viz1s, :start_year, :integer
  	add_column :viz1s, :ethnicity, :string
  	add_column :viz1s, :sex, :string
  	add_column :viz1s, :diabetes_type, :string
  	add_column :viz1s, :deprivation, :integer
  	add_column :viz1s, :ccg, :string
  	add_column :viz1s, :baseline_group, :string
  	add_column :viz1s, :measure_result, :decimal
  end
end

