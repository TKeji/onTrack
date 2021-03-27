from flask import request
from flask_restx import Resource

from webapp.models.user import User
from webapp.models.session import Session
from webapp.schemas import sessionSchema, sessionsSchema

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