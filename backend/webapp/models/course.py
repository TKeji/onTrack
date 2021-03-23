from webapp.extensions import db 



class Course(db.Model): 
    __tablename__ = 'course'

    code = db.Column(db.String(7), primary_key=True)
    title = db.Column(db.String(80), nullable=False)
    credits = db.Column(db.Integer, nullable=False)
    study_blocks = db.relationship('study_block', backref='course', lazy=True)
