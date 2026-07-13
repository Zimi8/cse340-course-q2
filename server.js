import express from 'express';
import { fileURLToPath } from 'url';
import path from 'path';
import { testConnection } from './src/models/db.js';
import dotenv from 'dotenv';
import { getAllProjects } from './src/models/projects.js'
import { getAllCategories } from './src/models/categories.js';
dotenv.config();





const NODE_ENV = process.env.NODE_ENV?.toLowerCase() || 'production';
const PORT = process.env.PORT || 3000;

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const app = express();

app.use(express.static(path.join(__dirname, 'public')));
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'src/views'));

app.get('/', async (req, res) => {
    const title = 'Home';
    res.render('home', { title });
});

app.get('/organizations', async (req, res) => {
    const title = 'Our Partner Organizations';
    res.render('organizations', { title });
});

app.get('/projects', async (req, res) => {
    try {
        const projects = await getAllProjects();
        const title = 'Service Projects';
        
        res.render('projects', { title, projects });
    } catch (error) {
        console.error("Error fetching projects:", error);
        res.status(500).send("Server Error");
    }
});

app.get('/categories', async (req, res) => {
    const title = 'Service Categories';
    res.render('categories', { title });
});

app.listen(PORT, () => {
  console.log(`Server is running at http://127.0.0.1:${PORT}`);
  console.log(`Environment: ${NODE_ENV}`);
});

app.listen(PORT, async () => {
  try {
    await testConnection();
    console.log(`Server is running at http://127.0.0.1:${PORT}`);
    console.log(`Environment: ${process.env.NODE_ENV}`);
  } catch (error) {
    console.error('Error connecting to the database:', error);
  }
});

app.get('/categories', async (req, res) => {
    try {
        const categories = await getAllCategories();
        const title = 'Service Categories';
        
        res.render('categories', { title, categories });
    } catch (error) {
        res.status(500).send("Server Error");
    }
});