class SendUsMail < ActiveRecord::Base
	
    validates :FirstName, :presence => true
    validates :phone, :presence => true
    #validates :email, :format => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
    #validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
    #validates_format_of :email,:with => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
    validates :email, presence: true, format: { with: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i }

    validates :subject, :presence => true
    validates :message, :presence => true
    #validates :nickname,  :captcha  => true
	#has_attached_file :pdf
	#validates_attachment :pdf, content_type: { content_type: "application/pdf" }

	has_attached_file :file1, :styles => { :medium => "500x300#", :small => "350x250>" }, :default_url => "missing.jpg"
	validates_attachment_content_type :file1, :content_type => /\Aimage\/.*\Z/


end



