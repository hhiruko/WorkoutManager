CREATE EXTENSION IF NOT EXISTS pgcrypto;

create table if not exists users(
                                    id serial primary key,
                                    name varchar(30) not null,
    email varchar(100) unique not null,
    password text not null,
    avatar varchar,
    created_at timestamptz default now(),
    updated_at timestamptz default now()
    );

create table if not exists exercises(
                                        id serial primary key,
                                        name varchar(250) not null,
    link varchar not null,
    substitute_id integer references exercises,
    created_at timestamptz default now(),
    updated_at timestamptz default now()
    );

create table if not exists workouts(
                                       id serial primary key ,
                                       name varchar(250) not null,
    creator integer not null references users,
    visibility varchar(10) not null,
    created_at timestamptz default now(),
    updated_at timestamptz default now()
    );

create table if not exists workout_exercises(
                                                workout_id integer not null references workouts,
                                                exercise_id integer not null references exercises,
                                                exercise_order smallint not null,
                                                sets smallint not null,
                                                reps smallint not null,
                                                created_at timestamptz default now(),
    updated_at timestamptz default now()
    );

create table if not exists user_progress(
                                            id serial primary key,
                                            user_id integer not null references users,
                                            exercise_id integer not null references exercises,
                                            weight varchar(10) not null,
    created_at timestamptz default now(),
    updated_at timestamptz default now()
    );

