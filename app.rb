require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/vehicle')

get('/') do
  @vehicles = Vehicle.all()
  #above added because there's a loop in index.erb to display all cars added to lot
  erb(:index)
end

post('/vehicle') do
  make = params.fetch("make")
  model = params.fetch("model")
  year = params.fetch("year")
  vehicle = Vehicle.new(make, model, year)
  vehicle.save()
  @vehicles = Vehicle.all()
  #again, above added so it's available in index.erb both times
  erb(:index)
end

get('/vehicles/:id') do #this is the route someone will see to see particular car
  @vehicle = Vehicle.find(params.fetch("id"))
  erb(:vehicle) #vehicle.erb made to display each car dynamically
end
