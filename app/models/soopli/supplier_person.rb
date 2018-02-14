module Soopli
  class SupplierPerson < Person
    has_many :supplier_teams, :foreign_key => :supplier_person_id
    has_many :suppliers, through: :supplier_teams
    
  end
end