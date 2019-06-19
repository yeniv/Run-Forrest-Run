class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :direction]
  # before_action :verify_authenticity_token, only: [:direction]
  # protect_from_forgery prepend: true, with: :exception

  def home
    forrest = ForrestGump.last

    gon.running_route = forrest.route
    gon.running_distance = forrest.distance
    gon.forrest_quote = forrest.quotes.sample
    gon.starting_position = forrest.starting_position

    @distance_remaining = forrest.route_distance - forrest.distance
    @tweets = Tweet.all.sort { |a, b| b.mile <=> a.mile }.first(50)
  end

  def direction
    forrest = ForrestGump.last
    forrest.starting_position = params[:direction]
    forrest.save!
  end
end
