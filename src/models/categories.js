import db from './db.js';

const getAllCategories = async () => {
    const query = `SELECT category_id, name, description FROM public.category ORDER BY name ASC;`;
    const result = await db.query(query);
    return result.rows;
};

const getCategoryById = async (categoryId) => {
    const query = `
        SELECT category_id, name, description 
        FROM public.category 
        WHERE category_id = $1;
    `;
    const result = await db.query(query, [categoryId]);
    return result.rows.length > 0 ? result.rows[0] : null;
};

const getCategoriesByProjectId = async (projectId) => {
    const query = `
        SELECT c.category_id, c.name 
        FROM public.category c
        JOIN public.project_category pc ON c.category_id = pc.category_id
        WHERE pc.project_id = $1
        ORDER BY c.name ASC;
    `;
    const result = await db.query(query, [projectId]);
    return result.rows;
};

const getProjectsByCategoryId = async (categoryId) => {
    const query = `
        SELECT p.project_id, p.title 
        FROM public.project p
        JOIN public.project_category pc ON p.project_id = pc.project_id
        WHERE pc.category_id = $1
        ORDER BY p.project_date ASC;
    `;
    const result = await db.query(query, [categoryId]);
    return result.rows;
};

export { 
    getAllCategories, 
    getCategoryById, 
    getCategoriesByProjectId, 
    getProjectsByCategoryId 
};