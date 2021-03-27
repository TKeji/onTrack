from flask import request
from flask_restx import Resource

from webapp.models.course import Course
from webapp.schemas import coursesSchema, courseSchema

class CoursesResource(Resource): 
    def get(self): 
        try: 
            courses = Course.get_courses()
            courses_json = coursesSchema.dump(courses)
        except Exception as e: 
            print(e)
            return {'error': 'could not get all courses'}, 500
        return {'data': 
            courses_json
        }

    def post(self): 
        try: 
            req_json = request.get_json()
            print(req_json)
            course = courseSchema.dump(req_json)
            course = Course(**req_json)
            course.save() 
        except Exception as e: 
            return {'error': 'could not create course'}, 500

        return {'msg': 'course successfully added'}