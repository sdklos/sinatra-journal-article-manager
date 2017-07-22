module Slugifiable
  module InstanceMethods
    def slug
      self.name.downcase.gsub(" ", "-")
    end
  end

  module ClassMethods
    def self.find_by_slug(slug)
      @@name = slug.gsub("-", " ")
      self.all.detect {|var| var.name.downcase == @@name}
    end
  end
end
