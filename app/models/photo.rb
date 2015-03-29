class Photo < ActiveRecord::Base
  belongs_to :user

  mount_uploader :pic, PicUploader

  include PgSearch
  pg_search_scope :search_title, against: :title

  def self.text_search(query)
    # if query.present?
    #   search_title(query)
    # else
    #   scoped
    # end
    search_title(query)
  end

  has_many :taggings
  has_many :tags, through: :taggings

  def self.tagged_with(name)
    Tag.find_by_name!(name).photos
  end

  def self.tag_counts
    Tag.select("tags.*, count(taggings.tag_id) as count").
      joins(:taggings).group("taggings.tag_id")
  end
  
  def tag_list
    tags.map(&:name).join(", ")
  end
  
  def tag_list=(names)
    self.tags = names.split(",").map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end
end
