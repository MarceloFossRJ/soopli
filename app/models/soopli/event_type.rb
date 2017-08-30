module Soopli
  class EventType < ApplicationRecord
    has_paper_trail class_name: 'Soopli::EventTypeVersion'
    
    validates :name, presence: true, length: {in: 1..250}, uniqueness: true
  end
end
