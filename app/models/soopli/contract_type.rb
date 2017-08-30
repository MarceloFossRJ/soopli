module Soopli
  class ContractType < ApplicationRecord
    has_paper_trail class_name: 'Soopli::ContractTypeVersion'
    
    validates :name, presence: true, length: {in: 1..250}, uniqueness: true
    
  end
end
