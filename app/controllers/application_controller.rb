class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  # add routes
  get '/bakeries' do
    #get all the bakeries from the db
    bakeries = Bakery.all 
    #send them back as a json array
    bakeries.to_json
  end

  get '/bakeries/:id' do
    #looks up game in the db
    bakery = Bakery.find(params[:id])
    #JSON formatted response
    bakery.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    baked_goods = BakedGood.by_price
    baked_goods.to_json
  end

  get '/baked_goods/most_expensive' do
    baked_good = BakedGood.by_price.first
    baked_good.to_json
  end

end
