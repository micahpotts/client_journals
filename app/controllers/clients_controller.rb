class ClientsController < ApplicationController
  #TODO Add the rest of the CRUD operations. Delete, edit and update missing.
  def index
    @clients = Client.all
    render json: @clients
  end

  def show
    @client = Client.find(params[:id])
    render json: @client
  end

  def show_by_provider
    provider = Provider.find(params[:id])
    @clients = provider.clients
    render json: @clients
  end

  def create
    @client = Client.new(email: params[:email], name: params[:name], plan: params[:plan])
    if @client.save
      render json: {status: "Success", message: "Client is saved", data:@client}
    else
      render json: {status: "Error", message: "Client was not created", data:@client.errors}, status: :unprocessable_entity
    end
  end
end
