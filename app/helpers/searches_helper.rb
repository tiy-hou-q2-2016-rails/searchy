module SearchesHelper

  def truncate_search(content, word)

    index = content.index(word)
    # Should return the meta description instead
    return truncate(content, length: 400) unless index

    start = index - 200
    ends  = index + 200

    content[start..ends]
  end

end
