CREATE TABLE files
(
    hash_id      VARCHAR(255) not null,
    filename     VARCHAR(255) not null,
    size         BIGINT       not null,
    created_time timestamp    null,
    primary key (hash_id)
);

CREATE TABLE users(
  id serial ,
    login VARCHAR(50) not null,
    password VARCHAR(200) not null,
  primary key(id)

);

delete  from users

ALTER TABLE users RENAME COLUMN login TO email;

ALTER TABLE users RENAME COLUMN email TO login;

insert into users (id, email, password) values (4, 'alex', '1234');

insert into users (id, email, password) values (5, 'alex@user.ru', '1234');

insert into users (id, login, password) values (4, 'alex', '1234');

insert into users (id, login, password) values (5, 'alex@user.ru', '1234');

select * from users;