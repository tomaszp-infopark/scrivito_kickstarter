require File.join(Rails.root + 'lib/scrival/cms_definitions')

# This class represents the base class of all CMS widgets and implements behavior that all CMS
# widgets have in common.
class Widget < ::Scrival::BasicWidget
  include Scrival::CmsDefinitions

  def homepage
    obj.homepage
  end
end
