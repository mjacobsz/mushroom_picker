class Mushroom < ApplicationRecord
  def self.chain_where(conditions)
    conditions.inject(self) do |mushroom_collection, condition|
      query_column = condition[0] # i.e. 'edible-status'
      query_value  = condition[1] # i.e. 'poisonous'

      column_value_hash = Hash.new
      column_value_hash[query_column] = query_value
      mushroom_collection.where(column_value_hash)
    end
  end

  def to_s
    attrs = self.attributes.reject { |k,v| k == "id" }
    attrs.map { |k, v| MushroomAttributes[k].key(v) }.join(",")
  end
end
