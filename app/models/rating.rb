class Rating < ApplicationRecord
  def self.create(rep, art, rater)
    Rating.create!({title: art, rate: rater, representative_id: rep})
  end
end
