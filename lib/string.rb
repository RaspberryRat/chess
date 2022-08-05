# frozen_string_literal: true

class String

  def is_lower?
    self == self.downcase
  end

  def is_upper?
    self == self.upcase
  end
end