module Slugifiable
  module InstanceMethods
    def slug
      self.name.downcase.gsub("/[\W]/", "-")
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      @@name = "#{slug}".gsub("-", " ")
      self.all.detect {|var| var.name.downcase.gsub("/[\W]/", " ") == @@name}
    end
  end
end
