class HomeController < ApplicationController
  def index
    @title = 'Home'
    @properties = Property.latest
  end
end
