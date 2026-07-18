import { getAllCategories, getCategoryById, getProjectsByCategoryId } from '../models/categories.js';

const showCategoriesPage = async (req, res, next) => {
    try {
        const categories = await getAllCategories();
        const title = 'Service Categories';
        res.render('categories', { title, categories });
    } catch (error) {
        next(error);
    }
};

const showCategoryDetailsPage = async (req, res, next) => {
    try {
        const categoryId = req.params.id;
        const categoryDetails = await getCategoryById(categoryId);
        const projects = await getProjectsByCategoryId(categoryId);
        const title = 'Category Details';
        res.render('category', { title, categoryDetails, projects });
    } catch (error) {
        next(error);
    }
};

export { showCategoriesPage, showCategoryDetailsPage };