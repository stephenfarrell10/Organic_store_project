require 'digest'
class User < ActiveRecord::Base

  has_many :products
#@reference wesley gorman laptop_shop 2 tutorial,step 27
  def self.authenticate(email, password)
    user = find_by_email(email)
    return user if user && user.authenticated?(password)
  end
 #@reference wesley gorman,laptop_shop 5 tutorial,step 7
  def authenticated?(password)
    self.hashed_password == encrypt(password   + "ruby_rocks" + self.salt)
  end

#@reference wesley gorman,laptop_shop 2,tutorial, step 25
  attr_accessor :password
  before_save :encrypt_password
  protected
  def encrypt_password
    return if password.blank?
    #@reference wesley gorman,laptop_shop 5 tutorial, step6
    salt = generate_salt
    self.hashed_password = encrypt( password + "ruby_rocks" + salt)
  end

  def encrypt(string)
    Digest::SHA1.hexdigest(string)
  end

#@reference wesley gorman laptop_shop 2, step 44
  validates :email,
            :uniqueness => true,
            :length => {:within => 5..30},
            :format => {:with =>
                            /^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i}
  validates :password,
            :confirmation => true,
            :length => {:within => 4..20},
            :presence => true

   validates_presence_of :forename, :surname,:town, :occupation

end

 #@reference wesley gorman,laptop_shop 5 tutorial, step5
def generate_salt
  chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
  salt = ""
  1.upto(10) { |i| salt << chars[rand(chars.size-1)] }
  self.salt = salt
end
