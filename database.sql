create table Category {
id int not null auto_increment,
'name' varchar(255),
'description' varchar(255),
created_at timestamp,
updated_at timestamp,
primary key (id)
}

create table Provider {
id int not null auto_increment,
'name' varchar(255),
'description' varchar(255),
origin_url text,
created_at timestamp,
updated_at timestamp,
primary key (id)
}

create table Course {
id int not null auto_increment,
'name' varchar(255),
'description' varchar(255),
code varchar(255),
origin_url text,
duration int,
is_active int,
created_at timestamp,
updated_at timestamp,
primary key (id)
}

