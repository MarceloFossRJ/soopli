module Soopli
  class RagStatus < ApplicationRecord
    belongs_to :rag_statusable, polymorphic: true
    
    validates :rag_status, presence: true, inclusion: { in: %w(Red Amber Green),
        message: "%{value} is not a valid value" }
    validates :description, presence: true
    
  end
end
