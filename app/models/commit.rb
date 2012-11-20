class Commit < ActiveRecord::Base
  attr_accessible :author_email, :author_name, :branch, :commit, :committed_at, :committer_email, :committer_name, :compare_url, :created_at, :message, :ref, :repository_id, :updated_at

  has_many :builds

  #Limit the rows to be shown on one page
  self.per_page = 10

end
