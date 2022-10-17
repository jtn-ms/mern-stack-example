const path = require('path');
const express = require('express');
const bodyParser = require('body-parser');

console.log('ENVIRONMENT    ', process.env.ENVIRONMENT)
console.log('PORT    ', process.env.PORT)
console.log('MONGO_URL    ', process.env.MONGO_URL)
if(process.env.ENVIRONMENT !== 'production') {
    require('dotenv').config()
}

const taskController = require('./controller/task.controller')

const app = express();
const port = process.env.PORT || 3080;

const ui_build_path = process.env.ENVIRONMENT === 'development'?'../ui/build':'./ui/build'

app.use(express.static(path.join(__dirname, ui_build_path)));
app.use(bodyParser.json());

app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, `${ui_build_path}/index.html`));
});

app.get('/api/tasks', (req, res) => {
    taskController.getTasks().then(data => res.json(data));
});

app.post('/api/task', (req, res) => {
    console.log(req.body);
    taskController.createTask(req.body.task).then(data => res.json(data));
});

app.put('/api/task', (req, res) => {
    taskController.updateTask(req.body.task).then(data => res.json(data));
});

app.delete('/api/task/:id', (req, res) => {
    taskController.deleteTask(req.params.id).then(data => res.json(data));
});

app.listen(port, () => {
    console.log(`Server listening on the port  ${port}`);
})