const sql = require('../config/db');

const TaskModel = (task) => {
    this.task = task.task;
    this.status = task.status;
    this.created_at = new Date();
};

TaskModel.createTask = (newTask, result) => {
    sql.query("INSERT INTO tasks set ?", newTask, (err, res) => {
        if (err) {
            console.log("error: ", err);
            result(err, null);
        } else {
            console.log(res.insertId);
            result(null, res.insertId);
        }
    });
};

TaskModel.getTaskById = (taskId, result) => {
    sql.query("Select task from tasks where id = ? ", taskId, (err, res) => {
        if (err) {
            console.log("error: ", err);
            result(err, null);
        } else {
            result(null, res);
        }
    });
};

TaskModel.getAllTask = (result) => {
    sql.query("Select * from tasks", (err, res) => {
        if (err) {
            console.log("error: ", err);
            result(null, err);
        } else {
            console.log('tasks : ', res);
            result(null, res);
        }
    });
};

TaskModel.updateById = (id, task, result) => {
    sql.query("UPDATE tasks SET task = ? WHERE id = ?", [task.task, id], (err, res) => {
        if (err) {
            console.log("error: ", err);
            result(null, err);
        } else {
            result(null, res);
        }
    });
};

TaskModel.remove = (id, result) => {
    sql.query("DELETE FROM tasks WHERE id = ?", [id], (err, res) => {
        if (err) {
            console.log("error: ", err);
            result(null, err);
        } else {
            result(null, res);
        }
    });
};

module.exports = TaskModel;
