create database Instagram

use Instagram

create table Users(
	UserID char(10) PRIMARY KEY,
	FirstName varchar(20),
	LastName varchar(20),
	School varchar(20),
	Address varchar(50),
	Email varchar(30),
	PhoneNumber varchar(15),
	Locations varchar(50),
	DateOfBirth char(10),
	Gender varchar(10)
	check(Gender Like 'Male' or Gender Like 'Female')
)

drop table Users
create table Friends(
	FriendID char(10),
	UserID char(10),
	Constraint FriendPK Primary Key(FriendID),
	Constraint FriendFK Foreign Key(UserID) References Users(UserID)
)
drop table Friends

create table PageLikes(
	UserID char(10),
	PageID char(10) Primary Key,
	Constraint PageLikesFK Foreign Key(UserID) References Users(UserID)
)

create table Pages(
	PageID char(10),
	PageName varChar(50),
	PageContent varChar(255),
	Constraint PagesPK Primary Key(PageID)
)
drop table Pages

create table Posts(
	UserID char(10),
	PostID char(10) Primary Key,
	PostDate char(10),
	PostContent varchar(255),
	Constraint PostsFK Foreign Key(UserID) References Users(UserID)
)

create table PostLikes(
	PostID char(10),
	UserID char(10),
	PageName varchar(20),
	PageContent varchar(255),

	Constraint PostLikesFK Foreign Key(PostID) References Posts(PostID),
	Constraint PostLikesFK2 Foreign Key(UserID) References Users(UserID)
)

create table Photos(
	PostID char(10),
	PhotoID char(10) Primary Key,
	ImageContent varChar(255),
	Constraint PhotosFK Foreign Key(PostID) References Posts(PostID)
)

create table Comments(
	UserID char(10),
	PostID char(10),
	CommentID char(10) Primary Key,
	CommentDate char(10),
	CommentContent varchar(255)
	constraint CommentsFK Foreign Key(PostID) References Posts(PostID),
	constraint CommentsFK2 Foreign Key(UserID) References Users(UserID)
)

create table CommentLikes(
	CommentID char(10),
	UserID char(10),
	constraint CommentLikesFK Foreign Key(CommentID) References Comments(CommentID),
	constraint CommentLikesFK2 Foreign Key(UserID) References Users(UserID)
)

create table Shares(
	UserID char(10),
	PostID char(10),
	constraint SharesFK Foreign Key(UserID) References Users(UserID),
	constraint SharesFK2 Foreign Key(PostID) References Posts(PostID)
)


