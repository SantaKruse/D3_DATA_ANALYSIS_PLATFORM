# rake db:migrate:down VERSION=20180409131440
class CreateVizOnes < ActiveRecord::Migration[5.0]
  def up
    create_table :viz_ones do |t|
      t.string   :patient_id
      t.integer  :year
      t.string   :ethnicity
      t.string   :sex
      t.string   :diabetes_type
      t.integer  :deprivation
      t.string   :ccg
      t.integer  :age
      t.decimal  :hba1c
      t.decimal  :chol
      t.decimal  :egfr
      t.decimal  :bmi
      t.decimal  :bp
      t.timestamps
    end
  end


end
