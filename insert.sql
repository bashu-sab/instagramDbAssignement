INSERT INTO Users (username, email, full_name, bio) VALUES
('bashu_sab', 'bashu@example.com', 'Bashu Sab', 'SQL enthusiast.'),
('pranav_p', 'pranav@example.com', 'Pranav P', 'Developer.'),
('hemanth_h', 'hemanth@example.com', 'Hemanth H', 'Designer.');

INSERT INTO Posts (user_id, image_url, caption) VALUES
(1, 'https://media.licdn.com/dms/image/v2/D5622AQHEbqBBm38n0g/feedshare-shrink_2048_1536/feedshare-shrink_2048_1536/0/1729713269671?e=2147483647&v=beta&t=m7vo2xmbTgtZyt_VjUpHcHT6eR3HWM88yE77dsrSmq4', 'My first post! #SQL'),
(2, 'https://media.licdn.com/dms/image/v2/D5622AQG_2gRU0zoP6w/feedshare-shrink_800/B56ZSTT2qBGoAg-/0/1737638244347?e=2147483647&v=beta&t=u14GmjnaoNl5lXye2cwZBcavZd-M1GTZcxHqcf2Vre4', 'Loving this new project.'),
(1, 'https://media.licdn.com/dms/image/v2/D5622AQFzwVAruWjubA/feedshare-shrink_1280/B56ZRZ9DRDGsAk-/0/1736675966893?e=2147483647&v=beta&t=iV1Pi8YZ1H13DldN6jbZwt6edMoW2zjZn7jls_akOJs', 'Another day, another query.');

INSERT INTO Followers (follower_id, following_id) VALUES
(1, 2), -- Bashu follows Pranav
(2, 1), -- Pranav follows Bashu
(3, 1); -- Hemanth follows Bashu

INSERT INTO Likes (user_id, post_id) VALUES
(2, 1), -- Pranav likes Bashu's first post
(3, 1), -- Hemanth likes Bashu's first post
(1, 2); -- Bashu likes Pranav's post

INSERT INTO Comments (user_id, post_id, comment_text) VALUES
(2, 1, 'Great post!'),
(3, 1, 'Welcome to Instagram!'),
(1, 2, 'Looks interesting.');

GO 