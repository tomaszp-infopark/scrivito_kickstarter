class SearchPageController < CmsController
  def index
    @query = params[:q]
    limit = (params[:limit] || 100).to_i
    offset = (params[:offset] || 0).to_i

    results = Obj
      .all
      .offset(offset)
      .and(:_path, :starts_with, Homepage.default.path)

    if @query.present?
      results.and(:*, :contains_prefix, @query)
    end

    @hits = results.take(limit)
    @total = results.count
  end
end
