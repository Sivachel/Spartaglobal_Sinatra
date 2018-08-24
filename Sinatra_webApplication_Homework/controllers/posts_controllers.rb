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
      title: 'Liverpool',
      img_url:'https://d3j2s6hdd6a7rg.cloudfront.net/v2/uploads/media/default/0001/42/thumb_41755_default_news_size_5.jpeg',
      position: '1',
      post_body: 'This is the Liverpool Team'
    },
    {
      id: 1,
      title: 'Manchester United',
      position: '2',
      post_body: 'This is the Manchester United Team'
    },
    {
      id: 2,
      title: 'Man United',
      position: '3',
      post_body: 'This is the Man United Team'
    },
    {
      id: 3,
      title: 'Arsenal',
      position: '4',
      post_body: 'This is the Arsenal Team'
    }]



  get "/" do
    @title = "Teams"
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
