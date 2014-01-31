require 'casa/attribute/definition'
require 'casa/attribute/strategy/squash/use_latest'
require 'casa/attribute/strategy/transform/identity_map'
require 'casa/attribute/strategy/filter/list'

module CASA
  module Attribute
    class Title < Definition

      uuid '1f2625c2-615f-11e3-bf13-d231feb1dc81'

      section 'use'

      squash CASA::Attribute::Strategy::Squash::UseLatest

      filter CASA::Attribute::Strategy::Filter::List

      transform CASA::Attribute::Strategy::Transform::IdentityMap

    end
  end
end