module SpreeGlobalize
  module_function

  # Returns the version of the currently loaded SpreeGlobalize as a
  # <tt>Gem::Version</tt>.
  def version
    Gem::Version.new VERSION::STRING
  end

  module VERSION
    MAJOR = 3
    MINOR = 2
    TINY  = 0
    PRE   = 'alpha'.freeze

    STRING = [MAJOR, MINOR, TINY, PRE].compact.join('.')
  end
end
