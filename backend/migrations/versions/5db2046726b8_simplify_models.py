"""simplify models

Revision ID: 5db2046726b8
Revises: 6b5e14efa2e9
Create Date: 2021-03-26 22:00:19.650361

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '5db2046726b8'
down_revision = '6b5e14efa2e9'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_constraint('study_block_course_id_fkey', 'study_block', type_='foreignkey')
    op.drop_constraint('study_block_user_id_fkey', 'study_block', type_='foreignkey')
    op.drop_column('study_block', 'user_id')
    op.drop_column('study_block', 'course_id')
    op.add_column('user', sa.Column('password', sa.String(length=30), nullable=False))
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_column('user', 'password')
    op.add_column('study_block', sa.Column('course_id', sa.VARCHAR(length=7), autoincrement=False, nullable=False))
    op.add_column('study_block', sa.Column('user_id', sa.INTEGER(), autoincrement=False, nullable=False))
    op.create_foreign_key('study_block_user_id_fkey', 'study_block', 'user', ['user_id'], ['id'])
    op.create_foreign_key('study_block_course_id_fkey', 'study_block', 'course', ['course_id'], ['code'])
    # ### end Alembic commands ###