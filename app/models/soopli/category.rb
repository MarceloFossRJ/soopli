module Soopli
  class Category < ApplicationRecord
    has_paper_trail class_name: 'Soopli::CategoryVersion'
    belongs_to :status
    belongs_to :internal_person, :foreign_key => :internal_owner_id, required: false
    
    validates :name, presence: true, length: {in: 3..250}, uniqueness: true
    
  end
end
