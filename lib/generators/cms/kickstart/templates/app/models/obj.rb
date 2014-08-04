# This class represents the base class of all CMS objects and implements behavior that all CMS
# objects have in common.
class Obj < ::Scrivito::BasicObj
  def show_in_navigation?
    true
  end
end
