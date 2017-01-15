require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) { create(:user) }
  let(:post) { create(:post, user: user) }

  let(:valid_attributes) {
    {
      content: Populator.sentences(2..4),
      # attachment: post.attachment,
    }
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

  describe "GET #index" do
    it "assigns all posts as @posts" do
      get :index, {}
      expect(assigns(:posts)).to eq([post])
    end
  end

  describe "GET #show" do
    it "assigns the requested post as @post" do
      get :show, params: {id: post.to_param}
      expect(assigns(:post)).to eq(post)
    end
  end

  describe "GET #new" do
    it "assigns a new post as @post" do
      get :new, params: {content: Populator.sentences(2..4)}
      expect(assigns(:post)).to be_a_new(Post)
    end
  end

  describe "GET #edit" do
    it "assigns the requested post as @post" do
      get :edit, params: {id: post.to_param}
      expect(assigns(:post)).to eq(post)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Post" do
        expect {
          post :create, params: {post: valid_attributes}
        }.to change(Post, :count).by(1)
      end

      it "assigns a newly created post as @post" do
        post :create, params: {post: valid_attributes}
        expect(assigns(:post)).to be_a(Post)
        expect(assigns(:post)).to be_persisted
      end

      it "redirects to the created post" do
        post :create, params: {post: valid_attributes}
        expect(response).to redirect_to(root_path)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved post as @post" do
        post :create, params: {post: invalid_attributes}
        expect(assigns(:post)).to be_a_new(Post)
      end

      it "re-renders the 'new' template" do
        post :create, params: {post: invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      post && @post = user.posts.reload.first
    end

    it "destroys the requested post" do
      expect {
        delete :destroy, params: {id: @post.to_param}
      }.to change(user.posts, :count).by(-1)
    end

    it "redirects to the post list" do
      delete :destroy, params: {id: @post.to_param}
      expect(response).to redirect_to(posts_path)
    end
  end

end