require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do

  login_user
  
  let(:valid_attributes) {
    { :title => "Test title!", :description => "This is a test description"}
  }
  
  let (:valid_session) { {}}
  
  describe "GET #index" do
  it "returns a success response" do
    Category.create! valid_attributes
    get :index, params: {}, session: valid_session
    expect(response).to be_successful
  end
  
  it "returns a 200 response code" do
    Category.create! valid_attributes
    get :index, params: {}, session: valid_session
    expect(response.code).to eq("200")
  end
  
  it "returns an individual category show page" do
    category = Category.create! valid_attributes
    visit "/categories/#{category.id}"
      expect(page).to have_content(category.title)
    end
  end
end