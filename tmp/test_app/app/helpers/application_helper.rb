module ApplicationHelper
  def body_attributes(obj)
    attributes = {}

    if obj
      attributes[:data_current_obj_path] = obj.path

      if inplace_editing_allowed?
        attributes[:data_current_user_email] = current_user.try(:email)
        attributes[:data_current_first_name] = current_user.try(:first_name)
      end
    end

    attributes
  end
end
