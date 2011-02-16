module StartHelper

def idUsername (user_id)
@user = User.find(user_id)
return @user.username
end
	
def commentArticleTitle (comment)
@article = comment.article
return @article.title
end

def commentArticlePath (comment)
@article = comment.article
return article_path(@article)
end

end
