class Viz1Controller < ApplicationController

	def index
		@data = Viz1.search(params[:year], params[:sex], params[:ethnicity], params[:ccg])
	end

end
