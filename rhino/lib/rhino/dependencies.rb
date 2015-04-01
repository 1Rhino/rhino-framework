class Object
  # Object will call this method when method const_get can't get constant
  def self.const_missing(c)
    # TODO avoid infiniti call: const_get -> const_missing -> const_get...
    require Rhino.to_underscore(c.to_s)
    Object.const_get(c)
  end
end
