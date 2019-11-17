const express = require("express");
const bodyParser = require("body-parser");
const app = express();

app.use(bodyParser.json())
app.use(bodyParser.urlencoded({extended: true}))

//register route
require('./routes/taskRoute')(app)
// require('./routes/productRoute')(app)
require('./routes/UserRouter')(app)

var port = process.env.PORT || 8080;
app.listen(port, () => {
    console.log("We've now got a server!");
    console.log("Your routes will be running on http://localhost:" + port);
})
