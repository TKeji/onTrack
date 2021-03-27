from sqlalchemy import func, UniqueConstraint

from webapp.extensions import db 

class Session(db.Model): 
    __tablename__ = 'session'

    id = db.Column(db.Integer, primary_key=True)
    start_time = db.Column(db.DateTime, server_default=func.now(), nullable=False) 
    duration_s = db.Column(db.Integer, nullable=False)

    #? 1 course - Many sessions
    course_code = db.Column(db.String(7), db.ForeignKey('course.code'))
    course = db.relationship('Course', back_populates='sessions')
    #? 1 user - Many study blocks
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'))
    user = db.relationship('User', back_populates='sessions')

    db.UniqueConstraint(start_time, user_id)

    def __repr__(self): 
        return f"Session<id={self.id}, start={self.start_time}, duration={self.duration_s}, course_code={self.course_code}, user={self.user_id}>"


    def save(self): 
        db.session.add(self)
        db.session.commit()

    @classmethod
    def find_course_sessions(cls, user_id, course_code): 
        return cls.query.filter(cls.user_id == user_id).filter(cls.course_code == course_code).all()


    