# frozen_string_literal: true

class Representative < ApplicationRecord
  has_many :news_items, dependent: :delete_all
  def self.civic_api_to_representative_params(rep_info)
    reps = []
    rep_info.officials.each_with_index do |official, index|
      ocdid_temp = ''
      title_temp = ''
      city_temp = ''
      street_temp = ''
      state_temp = ''
      zip_temp = ''
      
      rep_info.offices.each do |office|
        if office.official_indices.include? index
          title_temp = office.name
          ocdid_temp = office.division_id
        end
      end
      if !official.address.nil? 
        official.address.each do |add|
          city_temp = add.city
          street_temp = add.line1
          state_temp = add.state
          zip_temp = add.zip
        end
      end
      party_temp = official.party
      photo_temp = official.photo_url 
      if(Representative.find_by(name: official.name).nil?)
      rep = Representative.create!({ name: official.name, ocdid: ocdid_temp,
          title: title_temp, city: city_temp, street: street_temp,
          state: state_temp, zip: zip_temp, party: party_temp, photo: photo_temp})
      else
        rep = Representative.find_by(name: official.name)
      end
      reps.push(rep)
    end

    reps
  end

  

end
