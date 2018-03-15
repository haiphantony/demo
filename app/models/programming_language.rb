class ProgrammingLanguage < ApplicationRecord
	has_many :developer_programming_languages
	has_many :developer, through: :developer_programming_languages
	#validate
	validates :name, presence: true, uniqueness: true
end
