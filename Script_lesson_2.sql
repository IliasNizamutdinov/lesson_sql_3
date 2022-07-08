create table if not exists genres(
id SERIAL primary key,
name varchar(60) not null
);
create table if not exists singers(
id SERIAL primary key,
name varchar(60) not null
);

create table if not exists records(
id SERIAL primary key,
name varchar(60) not null,
record_year int4
);

create table if not exists collections(
id SERIAL primary key,
name varchar(60) not null,
collection_year int4
);

create table if not exists genres_of_singers(
id SERIAL primary key,
genre_id INTEGER not null references genres(id),
singer_id INTEGER not null references singers(id)
);


create table if not exists records_of_singers(
id SERIAL primary key,
singer_id INTEGER not null references singers(id),
record_id INTEGER not null references records(id)
);

create table if not exists tracks(
id SERIAL primary key,
name varchar(60) not null,
long int4,
record_id INTEGER not null references records(id)
);

create table if not exists tracks_of_collections(
id SERIAL primary key,
id_track INTEGER not null references tracks(id),
id_collection INTEGER not null references collections(id)
);