class LegacyWidget < ActiveRecord::Base
  has_paper_trail :ignore  => :modification,
                  :modification => 'custom_version'
end
