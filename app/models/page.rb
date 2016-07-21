class Page < ApplicationRecord

  include PgSearch
  pg_search_scope :search,
    :against => [:title, :content],
    :using => {
                :tsearch => {:prefix => true, :negation => true, :dictionary => "english", :any_word => true},
              }

  # scope :search, -> (terms) { where("title ILIKE ?", "%#{terms}%").or(where("content ILIKE ?", "%#{terms}%"))}
end
