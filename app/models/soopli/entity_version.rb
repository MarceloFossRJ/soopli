module Soopli
  class EntityVersion < PaperTrail::Version
     self.table_name = :soopli_entity_versions
  end
end
