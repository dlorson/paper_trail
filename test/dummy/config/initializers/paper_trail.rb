module PaperTrail
  class Modification < ActiveRecord::Base
    attr_accessible :created_at, :updated_at, :answer, :action, :question, :article_id, :ip, :user_agent, :title
  end
end