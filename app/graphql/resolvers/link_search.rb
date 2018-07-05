require 'search_object/plugin/graphql'

class Resolvers::LinkSearch
  include SearchObject.module(:graphql)

  scope { Link.all } # scope is starting point for search

  type !types[Types::LinkType] # return type
  LinkFilter = GraphQL::InputFilterObjectType.define do
    name 'LinkFilter'
    argument :OR, -> { types[LinkFilter] }
    argument :description_contains, types.String
    argument :url_contains, types.String
  end

  # when "filter" is passed "apply_filter" would be called to narrow the scope
  option :filter, type: LinkFilter, with: :apply_filter

  # apply_filter recursively loops through "OR" branches
  def apply_filter(scope, value)
    #wip
  end
end
