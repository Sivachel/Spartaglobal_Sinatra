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
      img_url: "https://d3j2s6hdd6a7rg.cloudfront.net/v2/uploads/media/default/0001/42/thumb_41755_default_news_size_5.jpeg",
      position: '1',
      post_body: 'This is the Liverpool Team'
    },
    {
      id: 1,
      title: 'Manchester United',
      img_url:"https://s.hs-data.com/bilder/teamfotos/640x360/543.jpg",
      position: '2',
      post_body: 'This is the Manchester United Team'
    },
    {
      id: 2,
      title: 'Man City',
      img_url: "http://www.nationmultimedia.com/img/news/2018/04/16/30343239/ceef1e2faabb48b91bec2078baefc27d.jpeg",
      position: '3',
      post_body: 'This is the Man City Team'
    },
    {
      id: 3,
      title: 'Arsenal',
      img_url: "http://arsenalbanter.com/wp-content/uploads/2013/12/Arsenal-vs-Bayern-Munich.jpg",
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
    post.position = params[:position]
    post.img_url = params[:img_url]
    post.save
    redirect "/"
  end

  put "/:id" do
    id = params[:id].to_i
    post = Post.find[id]
    post.title = params[:title]
    post.post_body = params[:post_body]
    post.position = params[:position]
    post.img_url = params[:img_url]
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
