module Api
	class DevelopersController < ApplicationController
	  def index
	    developer = Developer.all
	    render json: developer, include: [:languages, :programming_languages]
	  end
	end
end