class Page < ApplicationRecord

  include PgSearch
  multisearchable :against => [:title, :content]

  # scope :search, -> (terms) { where("title ILIKE ?", "%#{terms}%").or(where("content ILIKE ?", "%#{terms}%"))}
end
