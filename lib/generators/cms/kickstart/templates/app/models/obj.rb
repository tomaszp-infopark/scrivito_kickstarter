require File.join(Rails.root + 'lib/scrival/cms_definitions')

# This class represents the base class of all CMS objects and implements behavior that all CMS
# objects have in common.
class Obj < ::Scrival::BasicObj
  include Scrival::CmsDefinitions

  def show_in_navigation?
    true
  end
end
