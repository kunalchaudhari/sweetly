module Sweetly
  module VERSION
    MAJOR = 1
    MINOR = 0
    TINY  = 9
    PRE   = "beta1"

    STRING = [MAJOR, MINOR, TINY, PRE].compact.join('.')
  end
end
