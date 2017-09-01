module Soopli
  class Person < ApplicationRecord
    has_paper_trail class_name: 'Soopli::PersonVersion'
    
    belongs_to :position
    
    validates :name, presence: true, length: {in: 3..250}
    validates :email, uniqueness: true, format: { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, 
              message: "Email not valid" }, allow_blank: true
        
#    scope :internal_people, -> { where(type: 'InternalPerson') } 
#    scope :supplier_people, -> { where(type: 'SupplierPerson') }
  end
end
