class MasterController < ApplicationController
  def new
  	@artist = Artist.new
  	@label = Label.new
  	@genre = Genre.new
  	@scene = Scene.new
  	@music = Music.new
  end
end
