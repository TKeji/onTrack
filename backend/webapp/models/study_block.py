from sqlalchemy import func

from webapp.extensions import db 

class Study_Block(db.Model): 
    __tablename__ = 'study_block'

    id = db.Column(db.Integer, primary_key=True)
    start_time = db.Column(db.DateTime, server_default=func.now(), nullable=False) 
    duration_s = db.Column(db.Integer, nullable=False)

    #? 1 course - Many study_blocks
    course_id = db.Column(db.String(7), db.ForeignKey('course.code'))
    #? 1 user - Many study blocks
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'))


    