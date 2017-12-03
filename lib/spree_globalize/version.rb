module SpreeGlobalize
  module_function

  # Returns the version of the currently loaded SpreeGlobalize as a
  # <tt>Gem::Version</tt>.
  def version
    Gem::Version.new VERSION::STRING
  end

  module VERSION
    MAJOR = 3
    MINOR = 3
    TINY  = 1

    STRING = [MAJOR, MINOR, TINY].compact.join('.')
  end
end
