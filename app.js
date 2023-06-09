var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var redis = require('redis');

var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');

var app = express();
var rclient = redis.createClient({
  host: 'redis-server',
  port: 6379
});
rclient.connect().then(() => { 
  rclient.set('visits' , 0);
})


// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', indexRouter);
app.use('/users', usersRouter);

app.get('/visitor', async function(req , res, next) {
  let cvCount = 0;
  try {
    cvCount = await rclient.get('visits');
    cvCount ++; 
    rclient.set('visits' , cvCount);
    res.send(`Total Visit Count : ${cvCount}`); 
  } catch (error) {
    res.send(`Visitor Count Not working`); 
  } 
});
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

module.exports = app;
