CREATE TABLE users(
    id  SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()



)

CREATE TABLE photos(
id SERIAL PRIMARY KEY,
image_url VARCHAR(250) NOT NULL,
user_id INT REFERENCES users(id),
 created_at TIMESTAMP DEFAULT NOW()
)

CREATE TABLE comments(
    id SERIAL PRIMARY KEY,
	comment_text VARCHAR(400),
	user_id INT REFERENCES users(id),
	photo_id INT REFERENCES photos(id),
	 created_at TIMESTAMP DEFAULT NOW()
)

CREATE TABLE likes(
	user_id INT REFERENCES users(id),
	photo_id INT REFERENCES photos(id),
	created_at TIMESTAMP DEFAULT NOW()







)








CREATE TABLE follows(
	follower_id INT REFERENCES users(id),
	followee_id INT REFERENCES users(id),
	created_at TIMESTAMP DEFAULT NOW()
	


)

CREATE TABLE tags(
	id SERIAL PRIMARY KEY,
	tag_name VARCHAR(50) NOT NULL 
	


)

CREATE TABLE photo_tags(
	photo_id INT REFERENCES photos(id),
	tag_id INT REFERENCES tags(id)
	

)








INSERT INTO users(username,created_at)















