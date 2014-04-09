require File.join(Rails.root + 'lib/scrival/cms_definitions')

# This class represents the base class of all CMS objects and implements behavior that all CMS
# objects have in common.
class Obj < ::Scrival::BasicObj
  include Scrival::CmsDefinitions

  def self.homepage
    default_homepage
  end

  def self.default_homepage
    Homepage.for_hostname('default')
  end

  def mediabrowser_details_view_path
    "#{obj_class.underscore}/details"
  end

  # Determines the homepage for the current object by traversing up the tree
  # until a homepage is found. In case of a ghost path (no parent) the default
  # homepage is returned.
  def homepage
    @homepage ||= if parent
      parent.homepage
    else
      self.class.default_homepage
    end
  end

  def homepages
    @homepages ||= parent.children.select { |obj| obj.is_a?(Homepage) }
  end

  def locale
    (homepage && homepage[:locale]) || I18n.default_locale
  end

  def show_in_navigation?
    true
  end
  def show_breadcrumbs?
    true
  end

  def breadcrumbs
    @breadcrumbs ||= begin
      breadcrumbs = ancestors.select { |obj| obj.respond_to?(:show_in_navigation?) && obj.show_in_navigation? }
      breadcrumbs + [self]
    end
  end
end
