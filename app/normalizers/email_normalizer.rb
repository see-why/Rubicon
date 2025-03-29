require_relative 'base_normalizer'

class EmailNormalizer < BaseNormalizer
  def call(val)
    val.strip.downcase
  end
end
