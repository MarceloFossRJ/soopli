module Soopli
  class Team < ApplicationRecord
    has_paper_trail class_name: 'Soopli::TeamVersion'
    
    validates :name, presence: true, length: {in: 1..250}, uniqueness: true
  end
end
