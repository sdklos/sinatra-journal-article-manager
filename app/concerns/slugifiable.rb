module Slugifiable
  module InstanceMethods
    def slug
      self.username.downcase.gsub(" ", "-")
    end
  end

  module ClassMethods
    def self.find_by_slug(slug)
      @@username = slug.gsub("-", " ")
      User.all.detect {|user| user.username.downcase == @@username}
    end
  end
end
