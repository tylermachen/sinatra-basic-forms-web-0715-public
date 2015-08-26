class App < Sinatra::Base
  set :views, Proc.new { File.join(root, '../views')}

  get '/' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/:id' do
    @song = Song.find(params[:id])
    erb :'songs/show'
  end

  get '/songs/:id/edit' do
    @song = Song.find(params[:id])
    erb :'songs/edit'
  end

  post '/songs/:id' do
    @song = Song.find(params[:id])
    @song.title = params[:song][:title]
    @song.artist = params[:song][:artist]
    @song.album = params[:song][:album]
    @song.genre = params[:song][:genre]
    @song.length = params[:song][:length]
    @song.save
    redirect "songs/#{params[:id]}"
  end
end
