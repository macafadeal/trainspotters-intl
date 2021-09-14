# frozen_string_literal: true

class CreateTrains < ActiveRecord::Migration[6.1]
  def change
    create_table :trains do |t|
      t.references :user, foreign_key: true
      t.string :manufacturer
      t.string :series
      t.string :main_operator

      t.timestamps
    end
  end
end
