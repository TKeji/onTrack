from webapp.extensions import db

class ArticleRatings(db.Model): 
    __tablename__ = 'article_ratings'

    user_id = db.Column(db.Integer, db.ForeignKey('user.id'), primary_key=True)
    user = db.relationship('User', back_populates='article_ratings')
    
    article_id = db.Column(db.Integer, db.ForeignKey('article.id'), primary_key=True)
    rating = db.Column(db.Integer, nullable=False)



    def __repr__(self): 
        return f'Rating<user_id: {self.user_id}, article_id: {self.article_id}, rating: {self.rating}>'
    
    def remove(self): 
        db.session.delete(self)
        db.session.commit()
        

    @classmethod 
    def find_by_id(cls, user_id, article_id): 
        return cls.query.filter(cls.user_id == user_id).filter(cls.article_id == article_id).first()
