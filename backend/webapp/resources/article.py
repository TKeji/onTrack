from flask import request
from flask_restx import Resource

from webapp.models.article import Article
from webapp.schemas import articlesSchema, articleSchema


class ArticlesResource(Resource): 
    def get(self): 
        try: 
            articles =  Article.get_articles()
            articles_json = articlesSchema.dump(articles)
        except Exception as e: 
            print(e)
            return {'msg': 'unable to get articles'}, 500
        
        return {'data': articles_json}
    
    def post(self): 
        try: 
            req_json = request.get_json() 
            articleSchema.load(req_json)
            article = Article(**req_json)
            article.save()
        except Exception as e: 
            print(e)
            return {'msg': 'unable to create article'}, 500
        return {'msg': 'Added the article'}, 201