class BlogArticleMailer < ApplicationMailer
	
	def blog_article_created(current_user, bloglnk, blog_title, blog_time)
	

		@current_user = current_user
	
		@title = blog_title

		@btime = blog_time

		@blog = bloglnk
	

			#to: user.email,
			mail(to: "dmuthuyia@gmail.com",
			from:"app@kenyanlove.com",
			subject: "New post: #{@title}"
			)
	end

end