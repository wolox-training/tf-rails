class OpenLibrary
  def book_info(isbn)
    response = HTTPHandler.books(isbn)
    needed_attrs = %w[title subtitle pagination authors]
    ret = { isbn: isbn }
    needed_attrs.each { |att| ret[att.to_sym] = response[att] }
    ret
  end
end
