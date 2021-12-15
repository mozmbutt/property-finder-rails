class HomeController < ApplicationController
  def index
    @properties = Property.latest
  end
end
