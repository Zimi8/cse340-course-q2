import db from './db.js';

const getAllProjects = async () => {
    const query = `
        SELECT 
            p.project_date, 
            p.title, 
            o.name AS organization_name 
        FROM public.project p
        JOIN public.organization o ON p.organization_id = o.organization_id
        ORDER BY p.project_date ASC;
    `;

    const result = await db.query(query);
    return result.rows;
};

export { getAllProjects };