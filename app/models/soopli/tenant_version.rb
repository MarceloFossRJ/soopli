module Soopli
  class TenantVersion < PaperTrail::Version
     self.table_name = :soopli_tenant_versions
  end
end