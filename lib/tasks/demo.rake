namespace :demo do
  require 'factory_bot_rails'
  require 'faker'
  desc "Faker data"
  task :generatedata, [:number] => :environment do |_,args|
  	#create 100 developer
    number = (args.number || 1).to_i
  	number.times do
  		email = loop do
  			email = Faker::Internet.email
  			break email unless Developer.exists?(email:email)
  		end
  		developer = FactoryBot.create(:developer, email: email)
  		#create relation language
  		language = Language.order("RANDOM()").first
  		FactoryBot.create(:developer_language, developer_id: developer.id, language_id:language.id )
  		programming = ProgrammingLanguage.order("RANDOM()").first
  		FactoryBot.create(:developer_programming_language, developer_id: developer.id, programming_language_id:programming.id )

  	end
  end

end
