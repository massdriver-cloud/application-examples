var express = require('express');
var router = express.Router();

const mongoose = require("mongoose")

const schema = mongoose.Schema({
	title: String,
	content: String,
})

const Post = mongoose.model("Post", schema)

router.get("/", async (req, res) => {
	const posts = await Post.find()
  res.render('posts', { data_posts: posts });
})

router.post("/", async (req, res) => {
	const post = new Post({
		title: req.body.title,
		content: req.body.content,
	})
	await post.save()

  const posts = await Post.find()
  res.render('posts', { data_posts: posts });
})

module.exports = router;

