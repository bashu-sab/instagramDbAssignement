CREATE DATABASE InstagramDB;
GO

USE InstagramDB;
GO

CREATE TABLE Users (
    user_id INT IDENTITY(1,1) PRIMARY KEY,
    username NVARCHAR(50) NOT NULL,
    email NVARCHAR(100) NOT NULL,
    full_name NVARCHAR(100),
    bio NVARCHAR(MAX),
    profile_picture_url NVARCHAR(255),
    created_at DATETIME2 DEFAULT GETDATE(),
    CONSTRAINT UQ_Users_Username UNIQUE (username),
    CONSTRAINT UQ_Users_Email UNIQUE (email)
);

CREATE TABLE Posts (
    post_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL,
    image_url NVARCHAR(255) NOT NULL,
    caption NVARCHAR(MAX),
    created_at DATETIME2 DEFAULT GETDATE(),
    CONSTRAINT FK_Posts_Users FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Followers (
    follower_id INT NOT NULL,
    following_id INT NOT NULL,
    created_at DATETIME2 DEFAULT GETDATE(),
    CONSTRAINT PK_Followers PRIMARY KEY (follower_id, following_id),
    CONSTRAINT FK_Followers_Follower FOREIGN KEY (follower_id) REFERENCES Users(user_id),
    CONSTRAINT FK_Followers_Following FOREIGN KEY (following_id) REFERENCES Users(user_id)
);

CREATE TABLE Likes (
    like_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL,
    post_id INT NOT NULL,
    created_at DATETIME2 DEFAULT GETDATE(),
    CONSTRAINT UQ_Likes_User_Post UNIQUE (user_id, post_id),
    CONSTRAINT FK_Likes_Users FOREIGN KEY (user_id) REFERENCES Users(user_id),
    CONSTRAINT FK_Likes_Posts FOREIGN KEY (post_id) REFERENCES Posts(post_id)
);

CREATE TABLE Comments (
    comment_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL,
    post_id INT NOT NULL,
    comment_text NVARCHAR(MAX) NOT NULL,
    created_at DATETIME2 DEFAULT GETDATE(),
    CONSTRAINT FK_Comments_Users FOREIGN KEY (user_id) REFERENCES Users(user_id),
    CONSTRAINT FK_Comments_Posts FOREIGN KEY (post_id) REFERENCES Posts(post_id)
);