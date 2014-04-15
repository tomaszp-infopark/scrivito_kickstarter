class Homepage < Obj
  def self.default
    find_by_path('/en')
  end

  def homepage
    self
  end

  def show_breadcrumbs?
    false
  end
end
