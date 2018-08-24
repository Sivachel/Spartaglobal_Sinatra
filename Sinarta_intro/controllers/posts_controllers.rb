class PostsController < Sinatra::Base
  #sets the root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__),'..')

  #Sets the view directory correctly
  set :views, Proc.new{File.join(root,'views')}


  configure :development do
    register Sinatra::Reloader
  end

  $posts = [{
      id: 0,
      title: 'Post 1',
      post_body: 'This is the first post'
    },
    {
      id: 1,
      title: 'Post 2',
      post_body: 'This is the second post'
    },
    {
      id: 2,
      title: 'Post 3',
      post_body: 'This is the third post'
    },
    {
      id: 3,
      title: 'Post 4',
      post_body: 'This is the fourth post'
    }]



  get "/" do
    @title = "Blog Posts"
    @posts = Post.all
    erb :'posts/index'
  end

  get "/new" do
    @title = 'New'

    @post = Post.new

    erb :'posts/new'
  end

  get "/:id" do
    id = params[:id].to_i
    @post = Post.find(id)
    erb :'posts/show'
  end

  post "/" do
    post = Post.new

    post.title = params[:title]
    post.post_body = params[:post_body]

    post.save

    redirect "/"
  end

  put "/:id" do
    id = params[:id].to_i

    post = Post.find(id)

    post.title = params[:title]
    post.post_body = params[:post_body]
    post.save
    redirect "/"
  end

  delete "/:id" do
    id = params[:id].to_i
    Post.destroy(id)

    redirect "/"
  end

  get "/:id/edit" do
    @title = 'Edit'
    id = params[:id].to_i
    @post = Post.find(id)
    erb :'posts/edit'
  end

end
