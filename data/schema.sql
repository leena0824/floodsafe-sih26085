CREATE EXTENSION IF NOT EXISTS postgis;

CREATE TABLE road_segments (
    id SERIAL PRIMARY KEY,
    name TEXT,
    geom geometry(LineString, 4326) NOT NULL,
    drainage_capacity REAL NOT NULL,
    elevation_m REAL NOT NOT NULL,
    base_risk REAL NOT NULL DEFAULT 0
);

CREATE TABLE observations (
    id SERIAL PRIMARY KEY,
    road_segment_id INTEGER REFERENCES road_segments(id),
    observed_at TIMESTAMPTZ NOT NULL,
    rainfall_mm REAL NOT NULL,
    water_depth_cm REAL,
    sensor_status TEXT NOT NULL DEFAULT 'active'
);

CREATE TABLE predictions (
    id SERIAL PRIMARY KEY,
    road_segment_id INTEGER REFERENCES road_segments(id),
    predicted_for TIMESTAMPTZ NOT NULL,
    horizon_minutes INTEGER NOT NULL,
    flood_probability REAL NOT NULL,
    confidence REAL NOT NULL,
    explanation JSONB NOT NULL
);

CREATE TABLE reports (
    id SERIAL PRIMARY KEY,
    geom geometry(Point, 4326) NOT NULL,
    reported_at TIMESTAMPTZ NOT NULL,
    water_depth_cm REAL,
    photo_url TEXT,
    verification_status TEXT NOT NULL DEFAULT 'pending',
    confidence REAL NOT NULL DEFAULT 0.5
);
