class JournalEntriesController < ApplicationController
  #TODO Add remaining CRUD ops. Need delete and update.
  def index
    if params["clients"]
      @journal_entries = JournalEntry.where(clients_id: params[:clients_id]).to_a
      render json: @journal_entries
    else
      @journal_entries = JournalEntry.all
      render json: @journal_entries
    end
  end

  def show_by_provider
    provider = Provider.find(params[:id])
    clients = provider.clients
    @journal_entries = JournalEntry.where(clients_id: clients).to_a
    render json: @journal_entries
  end

  def show_by_client
    client = Client.find(params[:id])
    @journal_entries = JournalEntry.where(clients_id: client).to_a
    render json: @journal_entries
  end

  def create
    @journal_entry = JournalEntry.new(text: params[:text], clients_id: params[:client_id])
    if @journal_entry.save
      render json: {status: "Success", message: "Entry is saved", data:@journal_entry}
    else
      render json: {status: "Error", message: "Entry was not created", data:@journal_entry.errors}, status: :unprocessable_entity
    end
  end
end
