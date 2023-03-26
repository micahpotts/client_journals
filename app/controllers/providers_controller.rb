class ProvidersController < ApplicationController
  def index
    @providers = Provider.all
    render json: @providers
  end

  def show
    @provider = Provider.find(params[:id])
    render json: @provider
  end

  def show_by_client
    client = Client.find(params[:id])
    @providers = client.providers
    render json: @providers
  end

  def create
    @provider = Provider.new(email: params[:email], name: params[:name])
    if @provider.save
      if params[:clients]
        c = params[:clients]
        p "clients #{c}"
        c.each do |n|
          to_be_assigned = Client.find_by(id: n)
          ProviderAssignment.create(provider: @provider, client: to_be_assigned)
        end
        render json: {status: "Success", message: "Provider is saved", data:@provider}
      else
        render json: {status: "Success", message: "Provider is saved", data:@provider}
      end
    else
      render json: {status: "Error", message: "Provider was not created", data:@provider.errors}, status: :unprocessable_entity
    end
  end
end
