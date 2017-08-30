module Soopli
  class Category < ApplicationRecord
    has_paper_trail class_name: 'Soopli::CategoryVersion'
    belongs_to :status
    
    validates :name, presence: true, length: {in: 3..250}, uniqueness: true
    
  end
end
