class OpenLibrary
  def self.book_info(isbn)
    handler = HTTPHandler.new
    response = handler.books(isbn)
    needed_attrs = %w[title subtitle pagination authors]
    ret = { isbn: isbn }
    needed_attrs.each { |att| ret[att.to_sym] = response[att] }
    ret
  end
end
