class HTTPHandler
  include HTTParty
  base_uri 'openlibrary.org'
  default_timeout 10

  def books(isbn)
    response = self.class.get('/api/books',
                              query: { bibkeys: "ISBN:#{isbn}", format: 'json', jscmd: 'data' })
    response.parsed_response["ISBN:#{isbn}"]
  end
end
