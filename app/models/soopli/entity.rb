module Soopli
  class Entity < ApplicationRecord
        has_paper_trail class_name: 'Soopli::EntityVersion'
        belongs_to :status
        
        validates :name, presence: true, length: {in: 3..250}, uniqueness: true
        validates :registration_name, presence: true, length: {in: 3..250}, uniqueness: true
        validates :linkedin, uniqueness: true, length: {in: 3..250}, allow_blank: true  
        validates :website, uniqueness: true, length: {in: 3..250}, :format => URI::regexp(%w(http https)), allow_blank: true
        validates :twitter, uniqueness: true, length: {in: 3..250}, allow_blank: true
        validates :status_id, presence: true
        validates :finantial_year, presence: true
  end
end
