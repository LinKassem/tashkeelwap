class SiteController < ApplicationController
	def index
    @top_ranks = Player.order('score DESC').limit(5)
	end
end