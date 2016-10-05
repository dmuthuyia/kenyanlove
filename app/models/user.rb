class User < ActiveRecord::Base
	has_many :products
	has_many :careers
	has_many :pictures
	has_many :ontechnologies
	has_many :blogs
	has_many :cans
	
	acts_as_votable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  # Assuming country_select is used with User attribute `country_code`
  # This will attempt to translate the country name and use the default
  # (usually English) name if no translation is available
  def country_name
    country = ISO3166::Country[Country]
    country.translations[I18n.locale.to_s] || country.name
  end


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


    has_attached_file :mypic, :styles => { :medium => "20x20>", :thumb => "10x10>" }, :default_url => "missing.png"
    validates_attachment_content_type :mypic, :content_type => /\Aimage\/.*\Z/
end
