class SkillInventoryApp < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), '..')
  set :method_override, true  # this allows us to use _method in the form

  get '/' do
    erb :dashboard
  end

  get '/skills' do
    # @skills = ["skill 1", "skill 2", "skill 3"]
    @skills = SkillInventory.all
    erb :index
  end

  get '/skills/new' do
    erb :new
  end

  post '/skills' do
    # "<p>Params: #{params}</p> <p>Task params: #{params[:task]}</p>"
    SkillInventory.create(params[:skill])
    redirect '/skills'
  end

  get '/skills/:id' do |id|
    @skill = SkillInventory.find(id.to_i)
    erb :show
  end

  get '/skills/:id/edit' do |id|
    @skill = SkillInventory.find(id.to_i)
    erb :edit
  end

  put '/skills/:id' do |id|
    SkillInventory.update(id.to_i, params[:skill])
    redirect "/skills/#{id}"
  end

  delete '/skills/:id' do |id|
    SkillInventory.delete(id.to_i)
    redirect '/skills'
  end


  not_found do
    erb :error
  end

end
