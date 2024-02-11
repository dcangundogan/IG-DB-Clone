SELECT * FROM users
SELECT * FROM likes
SELECT * FROM comments
SELECT * FROM photos
SELECT * FROM tags
SELECT * FROM photo_tags
/*We want to reward our users who have been around the longest.  

Find the 5 oldest users.*/

SELECT username,created_at FROM users
ORDER BY created_at
LIMIT 5 



/* 
What day of the week do most users register on?
*/
SELECT DAYNAME(created_at),COUNT(*) FROM users
GROUP BY DAYNAME(created_at)

/*We want to target our inactive users with an email campaign.

Find the users who have never posted a photo*/
SELECT username FROM users
LEFT JOIN photos
ON users.id=photos.user_id
WHERE photos.user_id IS NULL

/*We're running a new contest to see who can get the most likes on a single photo.*/

SELECT 
    username, Photos.id, Photos.image_url, COUNT(*) AS total
FROM
    Photos
        JOIN
    Likes ON Likes.photo_id = Photos.id
        JOIN
    Users ON Users.id = Photos.user_id
GROUP BY Photos.id
ORDER BY total DESC
LIMIT 1;



/*A brand wants to know which hashtags to use in a post

What are the top 5 most commonly used hashtags?*/

SELECT tags.tag_name,COUNT(*) AS totaltag FROM tags
INNER JOIN photo_tags
ON tags.id = photo_tags.tag_id

SELECT tags.tag_name,tag_id,COUNT(photo_id) FROM photo_tags
INNER JOIN tags
GROUP BY tag_id
ORDER BY COUNT(photo_id) DESC
LIMIT 5


/*
Find users who have liked every single photo on the site*/

SELECT username, 
       Count(*) AS num_likes 
FROM   users 
       INNER JOIN likes 
               ON users.id = likes.user_id 
GROUP  BY likes.user_id 
HAVING num_likes = (SELECT Count(*) 
                    FROM   photos); 






























