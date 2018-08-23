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
    @posts = $posts
    erb :'posts/index'
  end

  get "/new" do
    @title = 'New'

    @post = {
      id: "",
      title: "",
      post_body:""
    }
    erb :'posts/new'
  end

  get "/:id" do
    id = params[:id].to_i
    @post = $posts[id]
    erb :'posts/show'
  end

  post "/" do
    new_post = {
      id: $posts.length,
      title: params[:title],
      post_body: params[:post_body]
    }
    $posts.push(new_post)
    redirect "/"
  end

  put "/:id" do
    id = params[:id].to_i
    post = $posts[id]
    post[:title] = params[:title]
    post[:post_body] = params[:post_body]
    $posts[id] = post
    redirect "/"
  end

  delete "/:id" do
    id = params[:id].to_i
    $posts.delete_at(id)
    redirect "/"
  end

  get "/:id/edit" do
    @title = 'Edit'
    id = params[:id].to_i
    @post = $posts[id]
    erb :'posts/edit'
  end

end
