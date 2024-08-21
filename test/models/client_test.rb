require "test_helper"

class ClientsControllerTest < ActionDispatch::IntegrationTest
  
  setup do
    @client = clients(:one, :two)  # Asegúrate de tener configuradas las fixtures correctamente
  end

  test "render a list of clients" do
    get clients_path
    assert_response :success
  end

  test "render a detailed view of a client" do
    get client_path(@client)
    assert_response :success
  end

  
end
