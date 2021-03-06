# frozen_string_literal: true

class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
