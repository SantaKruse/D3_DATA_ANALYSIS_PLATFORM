class VizOnesController < ApplicationController

	def index
	end

  def search
    @viz_ones = VizOne.search(params)

    # This is going to render the partial, which will behanlded by viz_one.js
    respond_to do |format|
      format.html
      format.json { render json: @viz_ones }
    end

  end

  private

  end

end
