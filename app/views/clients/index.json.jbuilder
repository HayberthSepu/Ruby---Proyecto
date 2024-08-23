json.array!(@clients) do |client|
  json.partial! partial: "client_partial", client: client
end
