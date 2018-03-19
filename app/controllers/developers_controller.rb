class DevelopersController < ApplicationController
  # GET /developers
  def index
    @developerearchform = DeveloperSearchForm.new(search_params)
    @developers = @developerearchform.search.page(params[:page]).per(5)
  end

  private
    # search params
    def search_params
      return {} if params[:developer_search_form].blank?
      params.require(:developer_search_form ).permit(:language_id, :programming_language_id)
    end
end
