class RecipeSerializer < ActiveModel::Serializer
  attributes :title, :instructions, :minutes_to_complete, :user
  # has_one :user
end
