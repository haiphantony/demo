module Api
	class DevelopersController < ApplicationController
	  #get all developers
	  def index
	    developer = Developer.all
	    render json: developer, include: [:languages, :programming_languages]
	  end
	end
end