
class VizOne < ApplicationRecord

  def self.search(params)

    puts params

    sql_select = 
        "SELECT 
            'patient_id AS id_value
            , '#{params[:x_measure]}' AS x_name
            , TB1.#{params[:x_measure]} as x_value
            , '#{params[:y_measure]}' AS y_name
            , TB1.#{params[:y_measure]} as y_value"

    sql_select_grouping = if params[:grouping] == "none"
                            "'#{params[:grouping]}' AS grouping_value"
                          else
                            "REPLACE(TB1.#{params[:grouping]}, ' ', '_') AS grouping_value" 
                          end  

    sql_from = 
        "FROM VIZ_ONES TB1"

    sql_where = 
        "WHERE 
        TB1.ETHNICITY IN ('#{params[:ethnicity].join("','")}')
        AND TB1.SEX IN ('#{params[:sex].join("','")}')
        AND TB1.YEAR = #{params[:year]}
        AND TB1.DIABETES_TYPE IN ('#{params[:diabetes_type].join("','")}')"  

    sql_complete = sql_select + ", " + sql_select_grouping + " " + sql_from + " " + sql_where
        
    results = self.find_by_sql(sql_complete)


  end


end
