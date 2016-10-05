class DdsController < ApplicationController
    before_action :authenticate_user!, only: [:females, :kenyan_females, :non_kenyan_females, :males, :kenyan_males, :non_kenyan_males]
    
    def home
        @random_users = User.order("RANDOM()").limit(4)
    end

    def about_us
    	render
    end

    def csr
    	render
    end

    def business_continuity_management  
    	render
    end

    def cloud_computing
    	render
    end

    def project_management 
    	render
    end

    def partnerships
    	render
    end

    def females
        @females = User.where(:is_female  => true)
        #@females = User.where("is_female = 'true' OR Age = '2' ")
        #@females = User.where("is_female = ? AND Age = ?", true, 2)
        #@females =User.where(b[:is_female].eq(0).or(t[:Age].eq(3).order(:UserName))
    end

    def kenyan_females
        @kfemales = User.where("is_female = ? AND is_kenyan = ?", true, true)
    end

    def non_kenyan_females
        @nkfemales = User.where("is_female = ? AND is_kenyan = ?", true, false) 
    end

    def males
        @males = User.where(:is_female  => false)    
    end

    def kenyan_males
        @kmales = User.where("is_female = ? AND is_kenyan = ?", false, true)
    end

    def non_kenyan_males
        @nkmales = User.where("is_female = ? AND is_kenyan = ?", false, false) 
    end
end

