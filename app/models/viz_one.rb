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
    self.where('ethnicity LIKE ? OR sex LIKE ? OR diabetes_type LIKE ?', "#{params[:ethnicity]}", "#{params[:sex]}", "#{params[:diabetes_type]}")
  end


end
