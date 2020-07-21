class PrefecturesController < ApplicationController
	def index
		 @prefectures =  params[:search].present? ? Prefecture.prefecture_serach(params[:search]) :  Prefecture.all
	end
end
