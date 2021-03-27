from webapp.extensions import db 
# from webapp.models.study_block import Study_Block

# Associatoin table
course_list = db.Table('course_list',
    db.Column('course_id', db.String(7), db.ForeignKey('course.code'), primary_key=True),
    db.Column('user_id', db.Integer, db.ForeignKey('user.id'), primary_key=True)
)


class Course(db.Model): 
    __tablename__ = 'course'

    code = db.Column(db.String(7), primary_key=True)
    title = db.Column(db.String(80), nullable=False)
    credits = db.Column(db.Integer, nullable=False)

    # many -to many with Users
    users = db.relationship('User', secondary=course_list, lazy='subquery',
        backref=db.backref('courses', lazy=True))
    study_blocks = db.relationship('Study_Block', back_populates='course')

    def __repr__(self): 
        return f'Course<code={self.code}, title={self.title}, credits={self.credits}>'

    def save(self): 
        db.session.add(self)
        db.session.commit()

    @classmethod
    def get_courses(cls): 
        res = cls.query.all()
        return res
    
    @classmethod
    def find_by_id(cls, code): 
        course = cls.query.filter(cls.code == code).first()
        return course


