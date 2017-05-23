CREATE TABLE IF NOT EXISTS voters(
    voter_id INTEGER PRIMARY KEY NOT NULL,
    pw_hash VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    admin INTEGER NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS polls(
    poll_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    title VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    image VARCHAR(255) NOT NULL,
    begin_ts INTEGER NOT NULL,
    end_ts INTEGER NOT NULL,
    available_at INTEGER NOT NULL,
    frauds INTEGER NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS polls_items(
    item_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    poll_id INTEGER NOT NULL,
    title VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    votes INTEGER NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS polls_voters(
    poll_id INTEGER NOT NULL,
    voter_id INTEGER NOT NULL,
    voted INTEGER NOT NULL DEFAULT 0,
    PRIMARY KEY(poll_id, voter_id)
);

CREATE TABLE IF NOT EXISTS tokens(
    voter_id INTEGER PRIMARY KEY NOT NULL,
    token VARCHAR(64) NOT NULL,
    expiration_ts INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS item_votes(
    item INTEGER NOT NULL,
    identifier VARCHAR(255) NOT NULL,
    PRIMARY KEY(identifier)
);
