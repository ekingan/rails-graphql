Types::QueryType = GraphQL::ObjectType.define do
  name "Query"

  field :allLinks, !types[Types::LinkType] do
    description "Gets all Links"
    resolve ->(obj, args, ctx) { Link.all }
  end
end
