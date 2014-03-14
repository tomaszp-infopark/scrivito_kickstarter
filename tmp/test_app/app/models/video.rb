class Video < Obj
  def self.create(attributes)
    attributes = attributes.with_indifferent_access

    unless attributes.has_key?(:_obj_class)
      attributes[:_obj_class] = 'Video'
    end

    if attributes.has_key?(:blob) && !attributes.has_key?(:_path)
      filename = Pathname.new(attributes[:blob].path).basename
      path = "_resources/#{SecureRandom.hex(8)}/#{filename}"

      attributes[:_path] = path
    end

    super(attributes)
  end
end
