from flask import request
from flask_restx import Resource

from webapp.models.user import User
from webapp.schemas import coursesSchema

class UserCoursesResource(Resource):
    def get(self, user_id): 
        try: 
            user = User.find_by_id(user_id)
            courses = user.get_courses()
            courses_json = coursesSchema.dump(courses)
        except Exception as e: 
            print(e)
            return {'error': f'unable to get courses for user {user_id}'}, 500
        return {'data': 
            courses_json
        }
    

class UserCourseResource(Resource): 
    def post(self, user_id, course_code): 
        try: 
            user = User.find_by_id(user_id)
            user.add_course(course_code)
        except Exception as e: 
            print(e)
            return {'error': 'unable to add course to user'}, 500
        return {'msg': 'Added course to user'}
    
    def delete(self, user_id, course_code): 
        try: 
            user = User.find_by_id(user_id)
            user.remove_course(course_code)
        except Exception as e: 
            print(e)
            return {'error': 'unable to remove course from user'}, 500
        
        return {'msg': f'removed course {course_code}'}