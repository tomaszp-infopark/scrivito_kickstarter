require File.join(Rails.root + 'lib/scrivito_kickstarter/cms_definitions')

# This class represents the base class of all CMS widgets and implements behavior that all CMS
# widgets have in common.
class Widget < ::Scrivito::BasicWidget
  include ScrivitoKickstarter::CmsDefinitions
end
