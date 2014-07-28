class RedirectController < CmsController
  def index
    if !current_user.admin? && @obj.redirect_link
      target = cms_path(@obj.redirect_link, request.query_parameters)

      redirect_to(target)
    end
  end
end
