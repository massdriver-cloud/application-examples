const createError = require('http-errors');
const express = require('express');
const mongoose = require("mongoose")
const path = require('path');
const cookieParser = require('cookie-parser');
const logger = require('morgan');

const indexRouter = require('./routes/index');

const mongoHost = process.env.MONGO_HOSTNAME || "localhost"
const mongoPort = process.env.MONGO_PORT || "27017"
const mongoUser = process.env.MONGO_USERNAME || "root"
const mongoPass = process.env.MONGO_PASSWORD || ""

var mongoConnectionString = `mongodb://${mongoHost}:${mongoPort}/database`;
console.log("Connecting to MongoDB at " + mongoConnectionString)

const app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', indexRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});



mongoose
	.connect(mongoConnectionString, {
    useNewUrlParser: true,
    // auth: { authSource: "admin" },
    authSource: "admin",
    user: mongoUser,
    pass: mongoPass,
  })
	.then(() => {
		const app = express()

		app.listen(6000, () => {
			console.log("Server has started!")
		})
	})

module.exports = app;
