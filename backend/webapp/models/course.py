from webapp.extensions import db 



class Course(db.Model): 
    __tablename__ = 'article'

    code = db.Column(db.String(7), primary_key=True)
    title = db.Column(db.String(80))
    credits = db.Column(db.Integer)
