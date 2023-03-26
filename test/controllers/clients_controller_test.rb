require "test_helper"

class ClientsControllerTest < ActionDispatch::IntegrationTest
   test "see all clients" do
     get "/clients"
     assert_response :success
   end
   test "get client by id" do
     client_id = clients(:one).id
     get "/clients/#{client_id}"
     assert_response :success
   end
   test "create client" do
     new_client = {"name": "New Girl", "email": "its@jess.com", "plan": "basic"}
     post "/clients", params: new_client
     assert_response :success
   end
   test "update providers" do
     client_id = clients(:one).id
     provider_1 = providers(:one).id
     provider_2 = providers(:two).id
     provider_3 = providers(:three).id
     patch "/clients/#{client_id}/providers", params: {"providers": [provider_1, provider_2, provider_3]}
     assert_response :success
   end
   test "get clients by provider" do
     provider_id = providers(:one).id
     get "/providers/#{provider_id}/clients"
     assert_response :success
   end
end
