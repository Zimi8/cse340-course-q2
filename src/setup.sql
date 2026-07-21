CREATE TABLE public.organization (
    organization_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    logo_filename VARCHAR(255)
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