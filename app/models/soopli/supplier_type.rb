module Soopli
  class SupplierType < ApplicationRecord
    has_paper_trail class_name: 'Soopli::SupplierTypeVersion'
    
    has_many :suppliers
    
    validates :name, presence: true, length: {in: 1..250}, uniqueness: true
  end
end
