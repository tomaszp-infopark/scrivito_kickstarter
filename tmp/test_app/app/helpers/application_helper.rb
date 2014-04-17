module ApplicationHelper
  def body_attributes(obj)
    attributes = {}

    if obj
      attributes[:data] = {
        current_obj_path: obj.path,
        current_user_email: current_user.try(:email),
        current_user_first_name: current_user.try(:first_name),
      }
    end

    attributes
  end
end
