class Product < ActiveRecord::Base
  belongs_to :user
 has_many :line_items

 # @reference sam ruby, dave thomas, david heinemeier hanson, agile web development,chapter 7, page80
 validates :name, :description, :image_url, presence: true
validates :price, numericality: {greater_than_or_equal_to: 0.01}
validates :name, uniqueness: true
 validates_length_of :name, :minimum => 3
  validates :image_url, allow_blank: true, format: {
with: %r{\.(gif|jpg|png)$}i,
message: 'must be a URL for GIF, JPG or PNG image.'
}
  # @reference wesley gorman,laptop_shop 4 tutorial, step 20
  attr_accessible :name, :description, :price ,:image_url

# @reference wesley gorman,laptop_shop 1 tutorial,step 17
def self.search(search_query)
if search_query
find(:all,:conditions => ['name LIKE ?', "%#{ search_query}%"])
else
find(:all)
end
end

end

#   #has_many :orders, through: :line_items