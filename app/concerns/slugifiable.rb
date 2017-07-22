module Slugifiable
  module InstanceMethods
    def slug
      self.name.downcase.gsub("/[\s:]/", "-")
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      @@name = "#{slug}".gsub("-", "/[\s:]/")
      self.all.detect {|var| var.name.downcase == @@name}
    end
  end
end
