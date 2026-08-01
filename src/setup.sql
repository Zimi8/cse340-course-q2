DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS roles CASCADE;
DROP TABLE IF EXISTS public.project_category CASCADE;
DROP TABLE IF EXISTS public.project CASCADE;
DROP TABLE IF EXISTS public.category CASCADE;
DROP TABLE IF EXISTS public.organization CASCADE;

CREATE TABLE roles (
    role_id SERIAL PRIMARY KEY,
    role_name VARCHAR(50) UNIQUE NOT NULL,
    role_description TEXT
);

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role_id INTEGER REFERENCES roles(role_id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE public.organization (
    organization_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    logo_filename VARCHAR(255),
    contact_email VARCHAR(255)
);

CREATE TABLE public.category (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT
);

CREATE TABLE public.project (
    project_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    project_date DATE,
    location VARCHAR(255),
    organization_id INT REFERENCES public.organization(organization_id)
);

CREATE TABLE public.project_category (
    project_id INT REFERENCES public.project(project_id),
    category_id INT REFERENCES public.category(category_id),
    PRIMARY KEY (project_id, category_id)
);

INSERT INTO roles (role_name, role_description) VALUES 
    ('user', 'Standard user with basic access'),
    ('admin', 'Administrator with full system access');

INSERT INTO public.organization (name, description, logo_filename, contact_email) VALUES
    ('Habitat for Humanity', 'Building homes for those in need', 'habitat_logo.png', 'contact@habitat.org'),
    ('Red Cross', 'Emergency assistance and disaster relief', 'redcross_logo.png', 'info@redcross.org');

INSERT INTO public.category (name, description) VALUES
    ('Construction', 'Building and repair projects'),
    ('Relief', 'Disaster and emergency support');

INSERT INTO public.project (title, description, project_date, location, organization_id) VALUES
    ('Community Center Build', 'Building a new center in downtown', '2026-10-15', 'Downtown', 1),
    ('Flood Relief Efforts', 'Providing supplies to flood victims', '2026-08-20', 'Northside', 2);