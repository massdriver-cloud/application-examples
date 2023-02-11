import cors from 'cors';
import express from 'express';
import path from 'path';
import {
  analyzeSentiment,
  languageDetection
} from "./text/index.js";

const app = express();
const port = process.env.PORT || 80;

// To serve CSS and other static files from the public dir
app.use(express.static("/app-ui/build"));
app.use(cors());

app.get('/', (req, res) => {
  res.sendFile(path.join("/app-ui/build", "index.html"));
});

app.get('/language', (req, res) => {
  languageDetection(req)
    .then((response) => res.send(response))
    .catch((ex) => res.send(ex.message));
});

app.get('/sentiment', (req, res) => {
  analyzeSentiment(req)
    .then((response) => res.send(response))
    .catch((ex) => res.send(ex.message));
});

app.get('/health', (req, res) => {
  res.send('200: OK');
});

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get("env") === "development" ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render("error");
});

app.listen(port, () => {
  console.log(`Application listening on port ${port}`);
})
