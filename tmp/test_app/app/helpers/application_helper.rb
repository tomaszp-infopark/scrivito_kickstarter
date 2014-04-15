module ApplicationHelper
  def body_attributes(obj)
    attributes = {}

    if obj
      attributes[:data] = {
        current_obj_path: obj.path,
      }
    end

    attributes
  end
end
