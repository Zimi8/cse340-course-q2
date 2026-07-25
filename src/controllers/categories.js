import { getProjectDetails } from '../models/projects.js';
import { 
    getAllCategories, 
    getCategoriesByProjectId, 
    updateCategoryAssignments, 
    getCategoryById,
    getProjectsByCategoryId 
} from '../models/categories.js';

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

const showAssignCategoriesForm = async (req, res) => {
    const projectId = req.params.projectId;

    const projectDetails = await getProjectDetails(projectId);
    const categories = await getAllCategories();
    const assignedCategories = await getCategoriesByProjectId(projectId);

    const title = 'Assign Categories to Project';

    res.render('assign-categories', { title, projectId, projectDetails, categories, assignedCategories });
};

const processAssignCategoriesForm = async (req, res) => {
    const projectId = req.params.projectId;
    const selectedCategoryIds = req.body.categoryIds || [];
    
    const categoryIdsArray = Array.isArray(selectedCategoryIds) ? selectedCategoryIds : [selectedCategoryIds];
    
    await updateCategoryAssignments(projectId, categoryIdsArray);
    
    req.flash('success', 'Categories updated successfully.');
    res.redirect(`/project/${projectId}`);
};

export { 
    showCategoriesPage, 
    showCategoryDetailsPage,
    showAssignCategoriesForm,
    processAssignCategoriesForm
};