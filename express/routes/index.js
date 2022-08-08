var express = require('express');
var router = express.Router();
const Post = require("../models/post")

router.get("/", async (req, res) => {
	const posts = await Post.find()
  res.render('index', { data_posts: posts });
})

router.post("/", async (req, res) => {
	const post = new Post({
		title: req.body.title,
		content: req.body.content,
	})
	await post.save()

  // cheap "refresh"
  const posts = await Post.find()
  res.render('index', { data_posts: posts });
})

module.exports = router;

