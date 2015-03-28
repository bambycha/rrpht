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
end
