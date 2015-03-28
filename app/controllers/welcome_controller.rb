class WelcomeController < ApplicationController

  def index
  	@categories = Category.all
  	@listings = Listing.all.includes(:user).order('view_count DESC')
  	@images = Image.all
  end

end