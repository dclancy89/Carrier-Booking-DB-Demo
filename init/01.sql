CREATE TYPE user_type AS ENUM ('carrier', 'customer');

CREATE TABLE dge_user (
    id SERIAL PRIMARY KEY NOT NULL,
    name TEXT,
    type user_type
);

CREATE TABLE location (
    id SERIAL PRIMARY KEY NOT NULL,
    user_id INTEGER REFERENCES dge_user(id),
    address VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    latitude DECIMAL,
    longitude DECIMAL
);

CREATE TYPE status AS ENUM ('pending', 'accepted', 'enroute', 'arrived', 'completed', 'declined');

CREATE TABLE appointment (
    id SERIAL PRIMARY KEY NOT NULL,
    appointment_date DATE,
    appointment_time DATE,
    customer_id INTEGER REFERENCES dge_user(id),
    pickup_location_id INTEGER REFERENCES location(id),
    carrier_id INTEGER REFERENCES dge_user(id),
    appointment_status status
);

INSERT INTO dge_user (id, name, type) VALUES (
    1,
    'Smith Farms',
    'customer'
);

INSERT INTO dge_user (id, name, type) VALUES (
    2,
    'Clancy Farms',
    'customer'
);

INSERT INTO dge_user (id, name, type) VALUES (
    3,
    'Farm Pro Express',
    'carrier'
);

INSERT INTO dge_user (id, name, type) VALUES (
    4,
    'Tractor Hauler',
    'carrier'
);

INSERT INTO location (id, user_id, address, city, state, latitude, longitude) VALUES (
    1,
    1,
    '21660 W. Field Pkwy',
    'Deer Park',
    'Illinois',
    42.1585546,
    -88.0593495
);

INSERT INTO location (id, user_id, address, city, state, latitude, longitude) VALUES (
    2,
    2,
    '818 N West St',
    'Crown Point',
    'Indiana',
    41.4271059,
    -87.3712298
);

INSERT INTO location (id, user_id, address, city, state, latitude, longitude) VALUES (
    3,
    3,
    '3606 Belshaw Rd',
    'Lowell',
    'Indiana',
    41.3242603,
    -87.3338626
);

INSERT INTO location (id, user_id, address, city, state, latitude, longitude) VALUES (
    4,
    4,
    '20 S Milwaukee Ave',
    'Wheeling',
    'Illinois',
    42.1418144,
    -88.0476135
);