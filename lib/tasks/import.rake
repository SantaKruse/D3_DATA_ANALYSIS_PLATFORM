namespace :import do
  desc "TODO"
  task task1: :environment do
  	require 'csv'    
		CSV.foreach("/Users/dankruse/Documents/CODING_REPOS/RAILS_APPS/D3_DATA_ANALYSIS_PLATFORM/db/imports/csvfile.csv", :headers => true) do |row|
  		VizOne.create!(row.to_hash)
	end
  end

end


