from flask import request
from flask_restx import Resource

from webapp.models.user import User
from webapp.models.session import Session
from webapp.models.article import Article
from webapp.schemas import sessionSchema, sessionsSchema, articlesSchema

class UserSessionResource(Resource): 
    def get(self, user_id): 
        '''
        Get all sesssions belonging to a user 
        optional query parameter of course_code 
        '''
        try: 
            user = User.find_by_id(user_id)
            if 'course_code' in request.args:
                #! Find a single session
                print('*'*30)
                req_sessions = user.get_sessions(request.args['course_code'])
                sessions_json = sessionsSchema.dump(req_sessions)

            else: 
                sessions_json = sessionsSchema.dump(user.get_sessions())

        except Exception as e: 
            print(e)
            return {'error': 'Unable to get sessions'}, 500
        return {'data': 
            sessions_json
        }

    def post(get, user_id): 
        '''
        Add a study session 
        '''
        user_id = int(user_id)
        try: 
            # Get all fields
            req_json = request.get_json(silent=True)
            print(req_json)
            sessionSchema.load(req_json)
            new_session = Session(**req_json)
            new_session.user_id = user_id
            new_session.save()
        except Exception as e: 
            print(e)
            return {'error': 'Unable to add session'}, 500
        return {'msg': 'session successfully added'}, 201


class SessionArticleResource(Resource): 
    def get(self, session_id): 
        try: 
            session = Session.find_by_id(session_id)
            sess_articles = session.articles 
            print(sess_articles)
            sess_articles_json = articlesSchema.dump(sess_articles)

        except Exception as e: 
            return {'msg': f'unable to fetch articles for session {session_id}'}, 500
        return {'data': sess_articles_json}

    def post(self, session_id): 
        try: 
            req_json = request.get_json() 
            session = Session.find_by_id(session_id)
            article = Article.find_by_id(req_json['article_id'])
            session.add_article(article)
        except Exception as e: 
            print(e)
            return {'msg': f'unable to add article to session {session_id}'}, 500
        return {'msg': 'Successfully added article'}

        return {'msg': session_id}

    def delete(self, session_id): 
        try: 
            req_json = request.get_json() 
            session = Session.find_by_id(session_id)
            session.remove_article(req_json['article_id'])
        except Exception as e: 
            print(e)
            return {'msg': f'unable to remove article from session {session_id}'}, 500
        return {}, 204