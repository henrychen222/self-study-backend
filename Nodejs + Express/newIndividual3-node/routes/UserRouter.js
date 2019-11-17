/**
 * 10.22 night
 * configure 10.28 night
 */
const User = require('../model/UserModel');

module.exports = router => {
    router.route('/users')
    //work, create a user
        .post((req, res) => {
            let username = req.body.username; //bodyParser does the magic
            let password = req.body.password;

            let user = User.build({username: username, password: password});

            console.log(user);

            user.addUser((success) => {
                res.json({message: 'User created!'});
            }, (err) => {
                res.send(err);
            });
        })
        //work, get all user
        .get((req, res) => {
            let user = User.build();

            user.retrieveAll((users) => {
                if (users) {
                    res.json(users);
                } else {
                    res.send(401, "User not found");
                }
            }, (error) => {
                res.send("User not found");
            });
        });

    router.route('/users/:user_id')
    //work, get the specific user
        .get((req, res) => {
            let user = User.build();
            user.retrieveById(req.params.user_id, (users) => {
                if (users) {
                    res.json(users);
                } else {
                    res.send(401, "User not found");
                }
            }, (error) => {
                res.send("User not found");
            });
        })
        //work, update a user, have to update both username and password
        .put((req, res) => {
            let user = User.build();

            user.username = req.body.username;
            user.password = req.body.password;

            user.updateById(req.params.user_id, (success) => {
                console.log(success);
                if (success) {
                    res.json({message: 'User updated!'});
                } else {
                    res.send(401, "User not found");
                }
            }, (error) => {
                res.send("User not found");
            });
        })
        //work
        .delete((req, res) => {
            let user = User.build();

            user.removeById(req.params.user_id, (users) => {
                if (users) {
                    res.json({message: 'User removed!'});
                } else {
                    res.send(401, "User not found");
                }
            }, (error) => {
                res.send("User not found");
            });
        });
}


