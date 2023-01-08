# frozen_string_literal: true

class AddColumnsToRepresentatives < ActiveRecord::Migration[5.2]
  def change
    add_column :representatives, :ocdid, :string
    add_column :representatives, :title, :string
    add_column :representatives, :city, :string
    add_column :representatives, :street, :string
    add_column :representatives, :state, :string
    add_column :representatives, :zip, :string
    add_column :representatives, :party, :string
    add_column :representatives, :photo, :string
  end
end
