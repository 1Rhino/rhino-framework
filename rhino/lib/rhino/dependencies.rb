class Object
  # Object will call this method when method const_get can't get constant
  def self.const_missing(c)
    return if @already_check_missing
    # avoid infinite loop: const_get -> const_missing -> const_get ...
    @already_check_missing = true
    require Rhino.to_underscore(c.to_s)
    klass = Object.const_get(c)
    @already_check_missing = false
    klass
  end
end
