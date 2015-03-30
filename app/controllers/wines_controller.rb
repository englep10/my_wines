class WinesController < ApplicationController
	def index
		# @wines = Wine.all
	    if params[:query]
	      query = params[:query].gsub(' ', '+')
	      response = HTTParty.get("http://dev.markitondemand.com/Api/Quote/json?symbol=#{query}")
	      results = XML.parse(response)
	      @results = results['Data']
	    else
	      @results = []
	    end
	end

	# def show
	# 	@wine = Wine.find(params[:id])
	# end

end