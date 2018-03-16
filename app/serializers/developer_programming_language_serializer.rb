class DeveloperProgrammingLanguageSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :developer
  belongs_to :programmin_language
end
