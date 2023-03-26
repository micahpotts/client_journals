require "test_helper"

class JournalEntriesControllerTest < ActionDispatch::IntegrationTest
  test "get entries by provider" do
    provider_id = providers(:one).id
    get "/providers/#{provider_id}/journal_entries"
    assert_response :success
  end
  test "get entries by client" do
    client_id = clients(:one).id
    get "/clients/#{client_id}/journal_entries"
    assert_response :success
  end
end
