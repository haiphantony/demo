class Developer < ApplicationRecord
	#relation
	has_many :developer_languages
	has_many :languages, through: :developer_languages

	has_many :developer_programming_languages
	has_many :programming_languages, through: :developer_programming_languages

	#validate

	validates :email, presence: true, uniqueness: true
end
