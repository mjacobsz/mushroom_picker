class CreateMushrooms < ActiveRecord::Migration[5.2]
  def change
    create_table :mushrooms do |t|
      t.string :"edible-status"
      t.string :"cap-shape"
      t.string :"cap-surface"
      t.string :"cap-color"
      t.string :"bruises"
      t.string :"odor"
      t.string :"gill-attachment"
      t.string :"gill-spacing"
      t.string :"gill-size"
      t.string :"gill-color"
      t.string :"stalk-shape"
      t.string :"stalk-root"
      t.string :"stalk-surface-above-ring"
      t.string :"stalk-surface-below-ring"
      t.string :"stalk-color-above-ring"
      t.string :"stalk-color-below-ring"
      t.string :"veil-type"
      t.string :"veil-color"
      t.string :"ring-number"
      t.string :"ring-type"
      t.string :"spore-print-color"
      t.string :"population"
      t.string :"habitat"
    end
  end
end
