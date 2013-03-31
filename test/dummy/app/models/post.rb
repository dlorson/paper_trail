class Post < ActiveRecord::Base
  has_paper_trail :class_name => "PostModification"

end
