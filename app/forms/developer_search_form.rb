class DeveloperSearchForm
	include Virtus.model
  	include ActiveModel::Model
  	
  	attribute :email, String
  	attribute :language_id, Integer
  	attribute :programming_language_id, Integer
  	#PARAMS = [:email, :language_id, :programming_language_id].freeze
  	def search
  		query = Developer.all
    	if email.present?
        query = query.where(
	          'developers.email like :email ',
	          email: "%#{email}%"
	        )
	    end
     
      query = query.joins(:developer_languages).where( developer_languages: {language_id:  language_id}) if language_id.present?
      query = query.joins(:developer_programming_languages).where(developer_programming_languages: { programming_language_id:  programming_language_id }) if programming_language_id.present?
      

      query.order(created_at: :desc)
  	end
end
