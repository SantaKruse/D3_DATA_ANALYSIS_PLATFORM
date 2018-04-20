# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# table_names = %w(viz_ones)
# table_names.each do |table_name|
#   path = Rails.root.join('db', 'seeds', Rails.env, "#{table_name}.rb")
#   if File.exist?(path)
#     puts "Creating #{table_name}..."
#     require(path)
#   end
# end

      # t.string   :patient_id
      # t.integer  :year
      # t.string   :ethnicity
      # t.string   :sex
      # t.string   :diabetes_type
      # t.integer  :deprivation
      # t.string   :ccg
      # t.integer  :age
      # t.decimal  :hba1c
      # t.decimal  :chol
      # t.decimal  :egfr
      # t.decimal  :bmi
      # t.decimal  :bp
      # t.timestamps

VizOne.create(patient_id: 'abc123', year:2009, ethnicity: 'BLACK OR BLACK BRITISH', sex: 'MALE', diabetes_type: 'T1', deprivation: 3, ccg:"Lambeth", age: 35, hba1c: 45.3, chol: 3, egfr:90, bmi:34, bp: 124)
VizOne.create(patient_id: 'abc123', year:2010, ethnicity: 'BLACK OR BLACK BRITISH', sex: 'MALE', diabetes_type: 'T1', deprivation: 3, ccg:"Lambeth", age: 36, hba1c: 46.3, chol: 3, egfr:90, bmi:34, bp: 124)
VizOne.create(patient_id: 'abc123', year:2011, ethnicity: 'BLACK OR BLACK BRITISH', sex: 'MALE', diabetes_type: 'T1', deprivation: 3, ccg:"Lambeth", age: 37, hba1c: 47.3, chol: 3, egfr:90, bmi:34, bp: 124)
VizOne.create(patient_id: 'abc123', year:2012, ethnicity: 'BLACK OR BLACK BRITISH', sex: 'MALE', diabetes_type: 'T1', deprivation: 3, ccg:"Lambeth", age: 38, hba1c: 48.3, chol: 3, egfr:90, bmi:34, bp: 124)
VizOne.create(patient_id: 'abc123', year:2013, ethnicity: 'BLACK OR BLACK BRITISH', sex: 'MALE', diabetes_type: 'T1', deprivation: 3, ccg:"Lambeth", age: 39, hba1c: 49.3, chol: 3, egfr:90, bmi:34, bp: 124)
VizOne.create(patient_id: 'abc123', year:2014, ethnicity: 'BLACK OR BLACK BRITISH', sex: 'MALE', diabetes_type: 'T1', deprivation: 3, ccg:"Lambeth", age: 40, hba1c: 50.3, chol: 3, egfr:90, bmi:34, bp: 124)
VizOne.create(patient_id: 'abc123', year:2015, ethnicity: 'BLACK OR BLACK BRITISH', sex: 'MALE', diabetes_type: 'T1', deprivation: 3, ccg:"Lambeth", age: 41, hba1c: 51.3, chol: 3, egfr:90, bmi:34, bp: 124)
VizOne.create(patient_id: 'abc123', year:2016, ethnicity: 'BLACK OR BLACK BRITISH', sex: 'MALE', diabetes_type: 'T1', deprivation: 3, ccg:"Lambeth", age: 42, hba1c: 52.3, chol: 3, egfr:90, bmi:34, bp: 124)
VizOne.create(patient_id: 'abc123', year:2017, ethnicity: 'BLACK OR BLACK BRITISH', sex: 'MALE', diabetes_type: 'T1', deprivation: 3, ccg:"Lambeth", age: 43, hba1c: 53.3, chol: 3, egfr:90, bmi:34, bp: 124)
