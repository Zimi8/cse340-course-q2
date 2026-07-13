-- ========================================
-- Organization Table
-- ========================================
-- CREATE TABLE organization (
--    organization_id SERIAL PRIMARY KEY,
--   name VARCHAR(150) NOT NULL,
--    description TEXT NOT NULL,
--    contact_email VARCHAR(255) NOT NULL,
--    logo_filename VARCHAR(255) NOT NULL
--);

-- ========================================
-- Insert sample data: Organizations
-- ========================================-
--INSERT INTO organization (name, description, contact_email, logo_filename)
--VALUES
--('BrightFuture Builders', 'A nonprofit focused on improving community infrastructure through sustainable construction projects.', 'info@brightfuturebuilders.org', 'brightfuture-logo.png'),
--('GreenHarvest Growers', 'An urban farming collective promoting food sustainability and education in local neighborhoods.', 'contact@greenharvest.org', 'greenharvest-logo.png'),
--('UnityServe Volunteers', 'A volunteer coordination group supporting local charities and service initiatives.', 'hello@unityserve.org', 'unityserve-logo.png');

CREATE TABLE project (
    project_id SERIAL PRIMARY KEY,
    organization_id INTEGER NOT NULL,
    title VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    project_date DATE NOT NULL,
    FOREIGN KEY (organization_id) REFERENCES organization (organization_id)
);

INSERT INTO project (organization_id, title, description, location, project_date)
VALUES
(1, 'Downtown Park Renovation', 'Repairing benches and planting new trees.', 'Central Park', '2026-08-15'),
(1, 'Community Center Painting', 'Painting the interior of the local center.', 'Main St Community Center', '2026-09-02'),
(1, 'Playground Safety Upgrade', 'Installing soft ground materials.', 'Northside Playground', '2026-09-20'),
(1, 'Library Shelving Build', 'Constructing new wooden shelves.', 'City Library', '2026-10-05'),
(1, 'Bus Stop Shelter Repair', 'Fixing roofs on 3 local bus stops.', 'Various Locations', '2026-10-22'),

(2, 'Urban Garden Planting', 'Planting fall vegetables in the community plot.', 'Eastside Garden', '2026-08-18'),
(2, 'Compost Bin Workshop', 'Building and distributing compost bins.', 'GreenHarvest HQ', '2026-08-25'),
(2, 'Neighborhood Fruit Tree Pruning', 'Pruning public fruit trees for winter.', 'West Neighborhood', '2026-09-10'),
(2, 'Farmers Market Setup', 'Helping set up tents and tables for the market.', 'Town Square', '2026-09-14'),
(2, 'School Seedling Distribution', 'Handing out starter plants to kids.', 'Local Elementary', '2026-10-01'),


(3, 'Food Bank Sorting', 'Sorting canned goods and creating care packages.', 'Regional Food Bank', '2026-08-20'),
(3, 'Senior Center Tech Help', 'Teaching seniors how to use smartphones.', 'Sunset Senior Center', '2026-08-28'),
(3, 'Winter Coat Drive Collection', 'Collecting and organizing donated winter coats.', 'UnityServe Hub', '2026-11-05'),
(3, 'River Cleanup', 'Removing trash from the riverbanks.', 'South River Trail', '2026-09-30'),
(3, 'Animal Shelter Walkathon', 'Walking dogs and cleaning kennels.', 'City Animal Shelter', '2026-10-12');

CREATE TABLE category (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE project_category (
    project_id INTEGER NOT NULL,
    category_id INTEGER NOT NULL,
    PRIMARY KEY (project_id, category_id),
    FOREIGN KEY (project_id) REFERENCES project (project_id),
    FOREIGN KEY (category_id) REFERENCES category (category_id)
);

INSERT INTO category (name) VALUES
('Environmental'),
('Educational'),
('Community Service'),
('Health and Wellness');

INSERT INTO project_category (project_id, category_id) VALUES
(1, 1), (1, 3), 
(2, 3), 
(3, 4), 
(4, 2),
(5, 3), 
(6, 1), 
(7, 1), 
(8, 1), 
(9, 3),
(10, 2), 
(11, 4), 
(12, 2), 
(13, 3), 
(14, 1), (14, 4), 
(15, 4);