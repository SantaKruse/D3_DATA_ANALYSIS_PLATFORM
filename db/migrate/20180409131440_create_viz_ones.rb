# rake db:migrate:down VERSION=20180409131440
class CreateVizOnes < ActiveRecord::Migration[5.0]
  def up
    create_table :viz_ones do |t|
      t.string   :measure
      t.integer  :year
      t.integer  :start_year
      t.string   :ethnicity
      t.string   :sex
      t.string   :diabetes_type
      t.integer  :deprivation
      t.string   :ccg
      t.string   :baseline_group
      t.decimal  :measure_result

      t.timestamps
    end
  end

  def down
    drop_table :viz_ones
  end
end
