class Homepage < Obj
  def self.for_hostname(hostname)
    find_by_path('/en')
  end

  def desired_hostname
    'www.website.com'
  end

  def homepage
    self
  end

  def show_breadcrumbs?
    false
  end
end
