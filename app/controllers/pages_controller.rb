class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    gon.running_route = ForrestGump.last.route
    gon.running_distance = ForrestGump.last.distance

    @distance_remaining = 15_248 - ForrestGump.last.distance
    @tweets = Tweet.all.sort { |a, b| b.mile <=> a.mile }.first(50)
    # @tweets = Tweet.all.reverse.first(50)
  end
end
