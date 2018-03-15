class Developer < ApplicationRecord
	#relation
	has_many :developer_languages
	has_many :languages, through: :developer_languages

	has_many :develop_programming_languages
	has_many :programming_languages, through: :develop_programming_languages
end
