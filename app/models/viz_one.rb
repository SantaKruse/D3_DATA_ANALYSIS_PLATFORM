# Schema
# t.string   "measure"
# t.integer  "year"
# t.integer  "start_year"
# t.string   "ethnicity"
# t.string   "sex"
# t.string   "diabetes_type"
# t.integer  "deprivation"
# t.string   "ccg"
# t.string   "baseline_group"
# t.decimal  "measure_result"
# t.datetime "created_at",     null: false
# t.datetime "updated_at",     null: false

class VizOne < ApplicationRecord

  def self.search(params)
    puts 'FUKKKKKKKKKKKK'
    puts params[:y_measure]
    results = self
    results = results.select("'viz_ones'.'year' AS year_value, AVG('viz_ones'.'#{params[:y_measure]}') AS y_value, count('viz_ones'.'#{params[:y_measure]}') AS count_value, 'viz_ones'.'baseline_group' AS grouping_value, 'viz_ones'.'#{params[:x_measure]}' AS x_value")
    results = results.where('ethnicity IN (?)', params[:ethnicity]) if params[:ethnicity].present?
    results = results.where('sex IN (?)', params[:sex]) if params[:sex].present?
    results = results.where('diabetes_type IN (?)', params[:diabetes_type]) if params[:diabetes_type].present?
    results = results.where('ccg IN (?)', params[:ccg]) if params[:ccg].present?
    results = results.where('year = (?)', params[:year]) if params[:year].present?
    results = results.group(params[:grouping])
    results = results.group('sex')
    results = results.group('year')

    # If no matched results, return empty array
    results.is_a?(VizOne::ActiveRecord_Relation) ? results : results 
  end


end
