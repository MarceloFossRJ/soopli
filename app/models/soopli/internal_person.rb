module Soopli
  class InternalPerson < Person
    has_many :suppliers, :foreign_key => :internal_owner_id
    has_many :categories, :foreign_key => :internal_owner_id
    has_many :entities, :foreign_key => :internal_owner_id
    has_many :teams, :foreign_key => :internal_owner_id
        
  end
end
