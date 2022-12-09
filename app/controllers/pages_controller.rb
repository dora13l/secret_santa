class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def new
    @event = Event.new
  end

  def home
  end
end
