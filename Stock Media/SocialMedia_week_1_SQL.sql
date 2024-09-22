create database SocialMedia
use SocialMedia

-- Create User Profiles Table
CREATE TABLE UserProfiles (
    user_id INT PRIMARY KEY,
    username VARCHAR(50),
    location VARCHAR(100),
    followers_count INT,
    profile_creation_date DATE
);

-- Create Social Media Posts Table
CREATE TABLE SocialMediaPosts (
    post_id INT PRIMARY KEY,
    user_id INT,
    post_content TEXT,
    post_date CHAR(50),
    platform VARCHAR(50),
    sentiment_score_id INT,
    FOREIGN KEY (user_id) REFERENCES UserProfiles(user_id),
    FOREIGN KEY (sentiment_score_id) REFERENCES SentimentScores(sentiment_score_id)
);

-- Create Sentiment Scores Table
CREATE TABLE SentimentScores (
    sentiment_score_id INT PRIMARY KEY,
    sentiment_type VARCHAR(10),  -- 'positive', 'neutral', 'negative'
    confidence_score DECIMAL(5, 2)  -- Confidence score (e.g., 0.95 for 95% confidence)
);

-- Insert 10 example data entries into UserProfiles
INSERT INTO UserProfiles (user_id, username, location, followers_count, profile_creation_date)
VALUES 
(1, 'john_doe', 'New York, USA', 500, '2022-01-15'),
(2, 'jane_smith', 'London, UK', 1200, '2020-06-25'),
(3, 'mike_brown', 'Toronto, Canada', 900, '2021-05-10'),
(4, 'alice_wong', 'Sydney, Australia', 1500, '2019-11-20'),
(5, 'lucy_li', 'Beijing, China', 700, '2023-03-05'),
(6, 'raj_kapoor', 'Mumbai, India', 3000, '2018-07-14'),
(7, 'carla_garcia', 'Madrid, Spain', 1100, '2021-09-30'),
(8, 'fatima_hassan', 'Cairo, Egypt', 400, '2020-12-12'),
(9, 'david_jones', 'Cape Town, South Africa', 850, '2022-06-01'),
(10, 'sofia_martinez', 'Mexico City, Mexico', 1300, '2020-04-18');

-- Insert 10 example data entries into SentimentScores
INSERT INTO SentimentScores (sentiment_score_id, sentiment_type, confidence_score)
VALUES 
(1, 'positive', 0.85),
(2, 'negative', 0.90),
(3, 'neutral', 0.75),
(4, 'positive', 0.70),
(5, 'negative', 0.95),
(6, 'neutral', 0.80),
(7, 'positive', 0.88),
(8, 'negative', 0.92),
(9, 'neutral', 0.60),
(10, 'positive', 0.78);

-- Insert 10 example data entries into SocialMediaPosts
INSERT INTO SocialMediaPosts (post_id, user_id, post_content, post_date, platform, sentiment_score_id)
VALUES 
(101, 1, 'Loving the new product release!', '2024-09-18 ', 'Twitter', 1),
(102, 2, 'This service is terrible, never again.', '2024-09-19 ', 'Facebook', 2),
(103, 3, 'The update feels just okay, nothing special.', '2024-09-20', 'Instagram', 3),
(104, 4, 'The best app I’ve used in a long time!', '2024-09-18 ', 'LinkedIn', 4),
(105, 5, 'I am really disappointed with this service.', '2024-09-19 ', 'Twitter', 5),
(106, 6, 'Neutral feelings about the latest changes.', '2024-09-18 ', 'Facebook', 6),
(107, 7, 'This product keeps getting better and better!', '2024-09-20 ', 'Instagram', 7),
(108, 8, 'Absolutely frustrating experience, not worth it.', '2024-09-19 ', 'LinkedIn', 8),
(109, 9, 'I don’t feel strongly one way or another.', '2024-09-18 ', 'Twitter', 9),
(110, 10, 'I would highly recommend this to everyone.', '2024-09-20 ', 'Facebook', 10);

--Retrieve All Posts from a Specific User:

SELECT p.post_content, p.post_date, u.username, u.location
FROM SocialMediaPosts p
JOIN UserProfiles u ON p.user_id = u.user_id
WHERE u.username = 'john_doe';

--Retrieve Posts with a Specific Sentiment (e.g., Positive):

SELECT p.post_content, p.post_date, s.sentiment_type, s.confidence_score
FROM SocialMediaPosts p
JOIN SentimentScores s ON p.sentiment_score_id = s.sentiment_score_id
WHERE s.sentiment_type = 'positive';

--Calculate the Percentage of Sentiment Types Over Time:

SELECT s.sentiment_type, COUNT(s.sentiment_type) * 100.0 / (SELECT COUNT(*) FROM SocialMediaPosts) AS percentage
FROM SocialMediaPosts p
JOIN SentimentScores s ON p.sentiment_score_id = s.sentiment_score_id
GROUP BY s.sentiment_type;









