class ClientsController < ApplicationController
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
end
