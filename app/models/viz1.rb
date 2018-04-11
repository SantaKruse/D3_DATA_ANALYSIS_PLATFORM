class Viz1 < ApplicationRecord

  def self.search(year, sex, ethnicity, ccg)

  	query = self
  	query = query.where('year = ?', year) if year.present?
  	query = query.where('sex = ?', sex) if sex.present?	
  	query = query.where('ethnicity in (?)', ethnicity) if ethnicity.present?
   	query = query.where('ccg in (?)', ccg) if ccg.present?
  	query
    
  end

end
