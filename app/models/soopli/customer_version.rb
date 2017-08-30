module Soopli
  class CustomerVersion < PaperTrail::Version
     self.table_name = :soopli_customer_versions
  end
end