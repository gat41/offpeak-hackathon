class User < ActiveRecord::Base
  include Clearance::User

  has_many :listings, dependent: :destroy
  has_many :articles #gotta remove this eventually
  has_many :reservations, dependent: :destroy

  enum gender: { "unknown" => 0, male: 1, female: 2, na: 9 } #if in symbol will also be converted to string
  has_many :authentications, :dependent => :destroy

  def self.create_with_auth_and_hash(authentication,auth_hash)
    create! do |u|
      u.first_name = auth_hash["info"]["first_name"]
      u.last_name = auth_hash["info"]["last_name"]
      u.image_url = auth_hash["info"]["image"]
      u.email = auth_hash["extra"]["raw_info"]["email"]
      u.gender = auth_hash["extra"]["raw_info"]["gender"]
      u.authentications<<(authentication)
      u.encrypted_password = SecureRandom.hex(3)
    end
  end

  def fb_token
    x = self.authentications.where(:provider => :facebook).first
    return x.token unless x.nil?
  end

  def password_optional?
    true
  end

end

