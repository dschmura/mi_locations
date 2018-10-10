require 'rails_helper'

RSpec.describe PagesController, type: :controller do


  describe "GET #about" do
    it "returns http success" do
      get :about
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #contact" do
    it "returns http success" do
      get :contact
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #privacy" do
    it "returns http success" do
      get :privacy
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #project_status" do
    it "returns http success" do
      get :project_status
      expect(response).to have_http_status(200)
    end
  end

end
