class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    forrest = ForrestGump.last

    gon.running_route = forrest.route
    gon.running_distance = forrest.distance
    gon.forrest_quote = forrest.quotes.sample

    @distance_remaining = forrest.route_distance - forrest.distance
    @tweets = Tweet.all.sort { |a, b| b.mile <=> a.mile }.first(50)
    # @tweets = Tweet.all.reverse.first(50)
  end

  def direction
    flash.now[:notice] = params[:direction]
  end
end
