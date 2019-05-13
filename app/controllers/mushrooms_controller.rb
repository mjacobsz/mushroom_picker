class MushroomsController < ApplicationController
  def index
    @mushroom = Mushroom.new
    respond_to do |format|
      format.html
    end
  end
end
