
class VizOne < ApplicationRecord

  def self.search(params)

    puts params

    sql_where = 
        "WHERE 
        TB1.ETHNICITY IN ('#{params[:ethnicity].join("','")}')
        AND TB1.SEX IN ('#{params[:sex].join("','")}')
        AND TB1.YEAR = #{params[:year]}
        AND TB1.DIABETES_TYPE IN ('#{params[:diabetes_type].join("','")}')"  
    
        if params[:x_measure] != 'age' && params[:grouping] == 'none'
            sql_complete = 
                "SELECT 'id_' || TB2.ID AS id_value, '#{params[:x_measure]}' AS x_name, TB2.X_VALUE as x_value, '#{params[:y_measure]}' AS y_name, TB2.Y_VALUE as y_value
                FROM
                    (SELECT TB1.ID, AVG(#{params[:x_measure]}) AS X_VALUE, AVG(#{params[:y_measure]}) AS Y_VALUE
                    FROM VIZ_ONES TB1
                    #{sql_where}
                    GROUP BY TB1.ID) AS TB2"
        elsif ['hba1c','egfr','bmi','bp','chol','age'].include?("#{params[:x_measure]}") && ['hba1c','egfr','bmi','bp','chol'].include?("#{params[:y_measure]}") && params[:grouping] != 'none'
            sql_complete = 
                "SELECT 'id_' || TB2.#{params[:grouping]} AS id_value, '#{params[:x_measure]}' AS x_name, TB2.X_VALUE as x_value, '#{params[:y_measure]}' AS y_name, TB2.Y_VALUE as y_value
                FROM
                    (SELECT TB1.#{params[:grouping]}, AVG(#{params[:x_measure]}) AS X_VALUE, AVG(#{params[:y_measure]}) AS Y_VALUE
                    FROM VIZ_ONES TB1
                    #{sql_where}
                    GROUP BY TB1.#{params[:grouping]}) AS TB2"
        end
        
    results = self.find_by_sql(sql_complete)

    

# IF X CONTINUOUS AND Y CONTINOUR THEN AVG(X.VALUE), AVG(Y.VALUE)
# IF Y CONTNIOUS AND X NON CONTINOUS AND GROUPING NULL THEN X.VALUE, AVG(Y.VALUE)
# IF Y CONTNIOUS AND X NON CONTINOUS AND GROUPING NOT NULL THEN GROUPING.VALUE, X.VALUE, AVG(Y.VALUE), 

  end


end


    # year_sql = "'viz_ones'.'year' AS year_value" 
    # id_sql = ",'#{params[:x_measure]}' || cast(round('viz_ones'.'#{params[:x_measure]}',0) as integer) as id_value"
    # name_sql = ",'#{params[:x_measure]}' as x_name, '#{params[:y_measure]}' as y_name"
    

    # query_sql = year_sql + id_sql + name_sql
    
    # results = self
    # results = results.select(
    # "#{query_sql}"    
    # )

    # # ", cast(round('viz_ones'.'#{params[:x_measure]}',0) as integer) AS x_value
    # # , AVG(cast(round('viz_ones'.'#{params[:y_measure]}',0) as integer)) AS y_value
    # # , count('viz_ones'.'#{params[:y_measure]}') AS count_value
    # # , 'viz_ones'.'baseline_group' AS grouping_value")
    # # results = results.where('ethnicity IN (?)', params[:ethnicity]) if params[:ethnicity].present?
    # # results = results.where('sex IN (?)', params[:sex]) if params[:sex].present?
    # # results = results.where('diabetes_type IN (?)', params[:diabetes_type]) if params[:diabetes_type].present?
    # # results = results.where('ccg IN (?)', params[:ccg]) if params[:ccg].present?
    # # results = results.where('year = (?)', params[:year]) if params[:year].present?
    # # results = results.group(params[:grouping])
    # # results = results.group('sex')
    # # results = results.group('year')

    # # If no matched results, return empty array
    # results.is_a?(VizOne::ActiveRecord_Relation) ? results : results 