module Soopli
  class Status < ApplicationRecord
    has_many :entities
    has_many :categories
    has_many :suppliers
    
    validates :name, presence: true, inclusion: { in: %w(Active Pipeline Archived),
        message: "%{value} is reserved." }
  end
end
