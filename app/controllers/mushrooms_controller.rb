class MushroomsController < ApplicationController
  MUSHROOM_COUNT = Mushroom.count
  ALL_MUSHROOM_ATTRIBUTES = MushroomAttributes.keys

  def index
    @mushroom = Mushroom.new
    respond_to do |format|
      format.html
      format.json {
        mushroom_query_conditions = params["mushroom"].permit(ALL_MUSHROOM_ATTRIBUTES).to_hash.reject { |key, mushroom_attribute_value| mushroom_attribute_value == "" }
        mushroom_collection = mushroom_query_conditions.empty? ? Mushroom.all : Mushroom.chain_where(mushroom_query_conditions)
        render json: mushroom_collection.map { |mushroom| mushroom.to_s }
      }
    end
  end
end
