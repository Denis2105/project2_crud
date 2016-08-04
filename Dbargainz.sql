
create database Dbargainz;

create table users(
  id serial4 primary key,
  email varchar(100),
  password_digest varchar(400)
);

create table deals(
  id serial4 primary key,
  user_id varchar(500),
  name varchar(500),
  image_url varchar(1000),
  description varchar(5000),
  url varchar(1000)
);
