class ClientsController < ApplicationController
  def index
    @clients = Client.all
    render json: @clients
  end

  def show
    provider = Provider.find(params[:id])
    @clients = provider.clients
    # @client = Client.find(params[:id])
    render json: @clients
  end
end
