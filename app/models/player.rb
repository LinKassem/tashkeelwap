class Player < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable , :validatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  # Validations
  validates :name, :email, :password, :presence => true, :on=>:create
  validate :duplicate_email, :on=>:create
  validate :email_format
  validate :password_complexity
  #validate :letters_only
  validate :max_length

  # Call-backs
  before_save :ensure_authentication_token
	#before_action :authenticate! except => {Those actions that do not require authentication}

	# Relations
	has_many :rounds

	# Methods
  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

  def duplicate_email
    if Player.find_by email: email
      errors.add(:email, "has already been taken!")
    end
  end

  def email_format
    if email.present? and not email.match(/\b[A-Z0-9._%a-z\-]+(@gmail|@hotmail)\.com\z/) 
      errors.add(:email, "must be a gmail or a hotmail!")
    end
  end
  
  def password_complexity
    if password.present? and not password.match(/(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+/)
      errors.add(:password, "must include at least one lowercase letter, " +
          "one uppercase letter, and one digit")
    end
  end
 
# Removed it in case the user enters his name in Arabic 
#  def letters_only
#    regex = /\A[a-zA-Z]+\z/
#    warning_message = ": Use letters only please!"
#    validates_format_of :name 
#                        :with => regex, message: warning_message
#  end

  def max_length
    warning_message = "is too Long!"
    validates_length_of :name,
                        :maximum => 35 , message: warning_message
  end
 
private  
  
  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless Player.where(authentication_token: token).first
    end
	end

end
