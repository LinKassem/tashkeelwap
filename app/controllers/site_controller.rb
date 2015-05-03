class SiteController < ApplicationController
	def index
    @top_ranks = Player.order('score DESC').limit(10)
	end
end