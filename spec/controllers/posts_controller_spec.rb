require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) { create(:user) }
  let(:_post) { create(:post, user: user) }

  let(:valid_attributes) {
    { content: Populator.sentences(2..4) }
  }

  let(:invalid_attributes) {
    { content: '', user_id: '', content_html: nil}
  }

  def setup
    allow(controller).to receive(:current_user) { user }
    request.env["HTTP_REFERER"]   = 'http://test.host/'
    request.env["devise.mapping"] = Devise.mappings[:user]
  end

  before(:each) do
    setup
    sign_in user
  end

  # post :create, post: { attachment: @post.attachment, content: @post.content, user_id: @post.user_id }
  # Populator.sentences(2..4)

  describe "GET #show" do
    it "assigns the requested post as @post" do
      get :show, params: {id: _post.to_param}
      expect(assigns(:post)).to eq(_post)
    end
  end

  describe "GET #edit" do
    it "assigns the requested post as @post" do
      get :edit, params: {id: _post.to_param}
      expect(assigns(:post)).to eq(_post)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Post" do
        expect {
          post :create, xhr: true, params: {post: valid_attributes}
        }.to change(Post, :count).by(1)
      end

      it "assigns a newly created post as @post" do
        post :create, xhr: true, params: {post: valid_attributes}
        expect(assigns(:post)).to be_a(Post)
        expect(assigns(:post)).to be_persisted
        expect(response).to be_successful
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved post as @post" do
        post :create, xhr: true, params: {post: invalid_attributes}
        expect(assigns(:post)).to be_a_new(Post)
      end
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      _post && @post = user.posts.reload.first
    end

    it "destroys the requested post" do
      expect {
        delete :destroy, params: {id: @post.to_param}
      }.to change(user.posts, :count).by(-1)
    end
  end

end