class User < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable
        validates :first_name, presence: false
        validates :last_name, presence: false
        validates :email, format: { with: /\.org\z/, message: "only hpg"}
    # Setup accessible (or protected) attributes for your model
    protected


    # attr_accessible :title, :body
    acts_as_followable
    acts_as_follower
    has_many :posts
    has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "50x50>" }, :default_url => "avatar/missing.jpg"
    has_many :comments
    acts_as_liker
end
