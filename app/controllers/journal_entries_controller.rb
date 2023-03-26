class JournalEntriesController < ApplicationController
  def index
    if params["clients"]
      @journal_entries = JournalEntry.where(clients_id: params[:clients_id]).to_a
      render json: @journal_entries
    else
      @journal_entries = JournalEntry.all
      render json: @journal_entries
    end
  end

  def show
    @journal_entry = JournalEntry.find(params[:id])
    render json: @journal_entry
  end
end
