from flask import request 
from flask_restx import Resource

from webapp.models.ratings import ArticleRatings
from webapp.models.user import User

from webapp.schemas import  articleRatingSchema, articleRatingsSchema

class UserRatingsResource(Resource): 
    def get(self, user_id): 
        try: 
            user = User.find_by_id(user_id)
            user_articles = articleRatingsSchema.dump(user.get_articles())

        except Exception as e: 
            print(e)
            return {'error': 'Unable to get user rating for article'}, 500
        return {'data': user_articles}


    def post(self, user_id): 
        try: 
            req_json = request.get_json()
            user = User.find_by_id(user_id)
            print(req_json)
            user.add_rating(**req_json)
        except Exception as e: 
            print(e)
            return {'error': 'Unable to get user rating for article'}, 500
        return {'msg': 'Rating added'}, 201


    def delete(self, user_id): 
        try: 
            req_json = request.get_json()
            user = User.find_by_id(user_id)
            user.remove_rating(**req_json)
        except Exception as e: 
            print(e)
            return {'error': 'Unable to get delete rating for article'}, 500
        return {}, 204

