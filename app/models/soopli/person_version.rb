module Soopli
  class PersonVersion < PaperTrail::Version
     self.table_name = :soopli_person_versions
  end
end
