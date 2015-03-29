class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :photos, through: :taggings

  include PgSearch
  pg_search_scope :search_name, against: :name

  def self.tags_search(query)
    ft = search_name(query)
    a=[]; ft.each { |t| t.taggings.each { |p| a << p.photo } }; a
  end
end
