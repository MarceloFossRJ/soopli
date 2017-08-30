module Soopli
  class Person < ApplicationRecord
    scope :internal_person, -> { where(type: 'InternalPerson') } 
    scope :supplier_person, -> { where(type: 'SupplierPerson') }
  end
end
