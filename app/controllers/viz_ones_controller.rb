class VizOnesController < ApplicationController

  before_action :set_viz_ones

	def index
	end

  def search
    @viz_ones = VizOne.search(search_params)

    respond_to do |format|
      format.js
    end
  end

  private

  def set_viz_ones
    @viz_ones = VizOne.all
  end

  def search_params
    params.require(:viz_one).permit(:ethnicity, :sex, :diabetes_type)
  end

end
