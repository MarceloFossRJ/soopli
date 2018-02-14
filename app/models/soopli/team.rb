module Soopli
  class Team < ApplicationRecord
    has_paper_trail class_name: 'Soopli::TeamVersion'
    belongs_to :internal_person, :foreign_key => :internal_owner_id, required: false
    
    validates :name, presence: true, length: {in: 1..250}, uniqueness: true
  end
end
