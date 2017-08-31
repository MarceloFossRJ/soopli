module Soopli
  class Supplier < ApplicationRecord
    has_paper_trail class_name: 'Soopli::SupplierVersion'
    
    belongs_to :supplier_type
    belongs_to :status
    has_many :rag_statuses, as: :rag_statusable
    
    validates :name, presence: true, length: {in: 3..250}, uniqueness: true
    validates :website, uniqueness: true, length: {in: 3..250}, :format => URI::regexp(%w(http https)), allow_blank: true
    validates :twitter, uniqueness: true, length: {in: 3..250}, allow_blank: true
    validates :linkedin, uniqueness: true, length: {in: 3..250}, allow_blank: true
    validates :facebook, uniqueness: true, length: {in: 3..250}, allow_blank: true
    validates :github, uniqueness: true, length: {in: 3..250}, allow_blank: true
    validates :instagram, uniqueness: true, length: {in: 3..250}, allow_blank: true
    
    validates :registration_country, presence: true
    validates :supplier_type_id, presence: true
    validates :relation_started_at, presence: true
    validates :status_id, presence: true
#    validates :finantial_year, presence: true
    
  end
end
