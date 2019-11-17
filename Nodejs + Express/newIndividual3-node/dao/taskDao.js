/**
 * 10.22 night
 * https://www.codementor.io/julieisip/learn-rest-api-using-express-js-and-mysql-db-ldflyx8g2
 */
const Task = require('../model/taskModel');

const list_all_tasks = (req, res) => {
    Task.getAllTask((err, task) => {
        console.log('controller')
        if (err)
            res.send(err);
        console.log('res', task);
        res.send(task);
    });
};

const create_a_task = (req, res) => {
    var new_task = new Task(req.body);

    //handles null error
    if (!new_task.task || !new_task.status) {
        res.status(400).send({error: true, message: 'Please provide task/status'});
    } else {
        Task.createTask(new_task, (err, task) => {
            if (err)
                res.send(err);
            res.json(task);
        });
    }
};

const read_a_task = (req, res) => {
    Task.getTaskById(req.params.taskId, (err, task) => {
        if (err)
            res.send(err);
        res.json(task);
    });
};


const update_a_task = (req, res) => {
    Task.updateById(req.params.taskId, new Task(req.body), (err, task) => {
        if (err)
            res.send(err);
        res.json(task);
    });
};

const delete_a_task = (req, res) => {
    Task.remove(req.params.taskId, (err, task) => {
        if (err)
            res.send(err);
        res.json({message: 'Task successfully deleted'});
    });
};

module.exports = {
    listAllTasks: list_all_tasks,
    createTask: create_a_task,
    readTask: read_a_task,
    updateTask: update_a_task,
    deleteTask: delete_a_task
}
