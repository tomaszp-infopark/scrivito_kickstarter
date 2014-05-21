class RedirectController < CmsController
  def index
    if !current_user.admin? && @obj.redirect_link.present?
      target = cms_path(@obj.redirect_link.first, request.query_parameters)

      redirect_to(target)
    end
  end
end
