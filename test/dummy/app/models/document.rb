class Document < ActiveRecord::Base
  has_paper_trail :modifications => :paper_trail_versions,
                  :on => [:create, :update]
end
