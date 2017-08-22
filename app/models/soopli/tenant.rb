module Soopli
  class Tenant < ApplicationRecord
    has_paper_trail class_name: 'Soopli::TenantVersion'
  end
end
