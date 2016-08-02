
create database Dbargainz;

create table users(
  id serial4 primary key,
  email varchar(100),
  password_digest varchar(400)
);

create table deals(
  id serial4 primary key,
  user_id varchar(100),
  name varchar(100),
  image_url varchar(300),
  description varchar(500),
  url varchar(300),
  upvotes integer,
  downvotes integer
);
