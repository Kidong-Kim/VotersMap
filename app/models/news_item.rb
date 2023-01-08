# frozen_string_literal: true

class NewsItem < ApplicationRecord
  belongs_to :representative
  # has_many :ratings, dependent: :delete_all
  validates :issue, inclusion: { in: %(issues_list) }

  def self.find_for(representative_id)
    NewsItem.find_by(
      representative_id: representative_id
    )
  end
  def issues_list
    ['Free Speech', 'Immigration', 'Terrorism', 'Social Security and Medicare',
     'Abortion', 'Student Loans', 'Gun Control', 'Unemployment', 'Climate Change',
     'Homelessness', 'Racism', 'Tax Reform', 'NetNeutrality', 'Religious Freedom',
     'Border Security', 'Minimum Wage', 'Equal Pay']
  end
end
