# frozen_string_literal: true

class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.references :patient, null: true, foreign_key: true

      t.timestamps
    end
  end
end
