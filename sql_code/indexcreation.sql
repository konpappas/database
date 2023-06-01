CREATE INDEX idx_u_school_id ON user (school_id);
CREATE INDEX idx_b_school_id ON book (school_id);
CREATE INDEX idx_author_id ON book (author_id);
CREATE INDEX idx_category_id ON book (category_id);
CREATE INDEX idx_user_id ON borrow (user_id);
CREATE INDEX idx_isbn ON borrow (isbn);