/**
 * 10.22 night
 * https://www.codementor.io/julieisip/learn-rest-api-using-express-js-and-mysql-db-ldflyx8g2
 */
const taskOperation = require('../dao/taskDao')

module.exports = router => {
    router.post('/createTask', async (req, res) => {
        try {
            taskOperation.createTask()
        } catch (e) {

        }
    })

    router.get('/listAllTasks', async (req, res) => {
        try {
            await taskOperation.listAllTasks()
        } catch (e) {

        }
    })

    router.get('/readTask/{taskId}', async (req, res) => {
        try {
            await taskOperation.readTask()
        } catch (e) {

        }
    })

    router.put('/updateTask/{taskId}', async (req, res) => {
        try {
            await taskOperation.updateTask()
        } catch (e) {

        }
    })

    router.put('/deleteTask/{taskId}', async (req, res, next) => {
        try {
            await taskOperation.updateTask()
        } catch (e) {

        }
    })
}
// module.exports = function (app) {
//     var todoList = require('../controllers/todoListController');
//
//     // todoList Routes
//     app.route('/tasks')
//         .get(todoList.list_all_tasks)
//         .post(todoList.create_a_task);
//
//     app.route('/tasks/:taskId')
//         .get(todoList.read_a_task)
//         .put(todoList.update_a_task)
//         .delete(todoList.delete_a_task);
// };



