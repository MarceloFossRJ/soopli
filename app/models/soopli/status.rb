module Soopli
  class Status < ApplicationRecord
    has_many :entities
    has_many :categories
    has_many :suppliers
    
    validates :name, presence: true, exclusion: { in: %w(Active Pipeline Archived),
        message: "%{value} is reserved." }, on: :delete, on: :update
  end
end
