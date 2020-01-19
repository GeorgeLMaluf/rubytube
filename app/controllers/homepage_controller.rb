class HomepageController < ApplicationController
	def index
		@videos = Video.all
	end
end