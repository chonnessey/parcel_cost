require("sinatra")
require("sinatra/reloader")
require("./lib/parcel")
require("pry")
also_reload("lib/**/*.rb")

get('/parcels/new') do
  erb(:new_parcel)
end

post('/parcels') do
  height = params[:height]
  width = params[:width]
  length = params[:length]
  weight = params[:weight]
  parcel = Parcel.new(height, width, length, weight, nil)
  parcel.save()
  @parcels = Parcel.all()
  erb(:parcels)
end

get ('/') do
  @parcels = Parcel.all()
  erb(:parcels)
end
get ('/parcels') do
  @parcels = Parcel.all()
  erb(:parcels)
end

get ('/parcels/:id') do
  @parcel = Parcel.find(params[:id].to_i())
  erb(:parcel)
end
get ('/parcels/:id/edit') do
  @parcel = Parcel.find(params[:id].to_i())
  erb(:edit_parcel)
end

patch('/parcels/:id') do
  @parcel = Parcel.find(params[:id].to_i())
  @parcel.update(params[:height, :width, :length, :weight])
  @parcels = Parcel.all
  erb(:parcels)
end

delete('/parcels/:id') do
  @parcel = Parcel.find(params[:id].to_i())
  @parcel.delete()
  @parcels = Parcel.all
  erb(:parcels)
end