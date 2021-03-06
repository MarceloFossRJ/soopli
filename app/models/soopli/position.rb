module Soopli
  class Position < ApplicationRecord
    has_paper_trail class_name: 'Soopli::PositionVersion'
    
    has_many :people
    
    validates :name, presence: true, length: {in: 1..250}, uniqueness: true

  end
end
