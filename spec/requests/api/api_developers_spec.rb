require 'rails_helper'

RSpec.describe "Api::DevelopersController", type: :request do

  describe "GET /api/developers" do
   
  	
    context 'without relation data' do
    	before(:each) do
	        create(:developer,email:'hai@gmail.com')
	        get '/api/developers'
	    end
        let(:expected_response) do   
            Developer.all.map do |d|
            {
              "id" => d.id,
              "email" => d.email,
              "languages" => [],
              "programming_languages" => []
            }
          end
      end
      it "get all data" do
       expect(response).to be_success
       expect(response.status).to eq(200)
       expect(JSON.parse(response.body)).to eq(expected_response)
      end
    end

    context 'with relation data language and programming' do
    	before(:each) do 
	      @developer = create(:developer, email: 'hoa@gmail.com')
	      @language = create(:language, code: 'en')
	      @programming_language = create(:programming_language, name: 'ruby')
	      @developer_language = create(:developer_language, developer_id: @developer.id, language_id: @language.id)
	      @developer_programming_language = create(:developer_programming_language, developer_id: @developer.id, programming_language_id: @programming_language.id)
	      get '/api/developers'
	    
	    end
        let(:expected_response) do   
            Developer.all.map do |d|
            {
              "id" => d.id,
              "email" => d.email,
              "languages" => d.languages.map do |l|
              		{
              			"id" => l.id,
              		    "code" => l.code
              		}
              		
              	end,
              "programming_languages" => 
              	d.programming_languages.map do |p|
              		{
              			"id" => p.id,
              		    "name" => p.name
              		}
              		
              	end
            }
          end
      end
      it "get all data" do
       expect(response).to be_success
       expect(response.status).to eq(200)
       expect(JSON.parse(response.body)).to eq(expected_response)
      end
    end
    context 'with only relation language ' do
    	before(:each) do 
	      @developer = create(:developer, email: 'hoa@gmail.com')
	      @language = create(:language, code: 'en')
	      @programming_language = create(:programming_language, name: 'ruby')
	      @developer_language = create(:developer_language, developer_id: @developer.id, language_id: @language.id)
	      get '/api/developers'
	    
	    end
        let(:expected_response) do   
            Developer.all.map do |d|
            {
              "id" => d.id,
              "email" => d.email,
              "languages" => d.languages.map do |l|
              		{
              			"id" => l.id,
              		    "code" => l.code
              		}
              		
              	end,
              "programming_languages" =>[]
            }
          end
      end
      it "get all data" do
       expect(response).to be_success
       expect(response.status).to eq(200)
       expect(JSON.parse(response.body)).to eq(expected_response)
      end
    end

    context 'with only relation programming_language ' do
    	before(:each) do 
	      @developer = create(:developer, email: 'hoa@gmail.com')
	      @language = create(:language, code: 'en')
	      @programming_language = create(:programming_language, name: 'ruby')
	      @developer_programming_language = create(:developer_programming_language, developer_id: @developer.id, programming_language_id: @programming_language.id)
	      get '/api/developers'
	    
	    end
        let(:expected_response) do   
            Developer.all.map do |d|
            {
              "id" => d.id,
              "email" => d.email,
              "languages" => [],
              "programming_languages" => 
              	d.programming_languages.map do |p|
              		{
              			"id" => p.id,
              		    "name" => p.name
              		}
              		
              	end
            }
          end
      end
      it "get all data" do
       expect(response).to be_success
       expect(response.status).to eq(200)
       expect(JSON.parse(response.body)).to eq(expected_response)
      end
    end
  end
end
