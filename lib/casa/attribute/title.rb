require 'casa/attribute/definition'
require 'casa/operation/squash/use_latest'
require 'casa/operation/transform/identity_map'
require 'casa/operation/filter/list'

module CASA
  module Attribute
    class Title < Definition

      uuid '1f2625c2-615f-11e3-bf13-d231feb1dc81'

      section 'use'

      squash CASA::Operation::Squash::UseLatest

      filter CASA::Operation::Filter::List

      transform CASA::Operation::Transform::IdentityMap

    end
  end
end