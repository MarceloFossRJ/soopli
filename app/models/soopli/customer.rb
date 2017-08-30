module Soopli
  class Customer < ApplicationRecord
    has_paper_trail class_name: 'Soopli::CustomerVersion'
  end
end
