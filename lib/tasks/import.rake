namespace :import do
  task task1: :environment do
  	require 'csv'    
		CSV.foreach("/db/imports/csvfile.csv", :headers => true) do |row|
  		VizOne.create!(row.to_hash)
	end
  end

end


