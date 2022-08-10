defmodule K8sElixirPostgres.PostsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `K8sElixirPostgres.Posts` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        content: "some content",
        title: "some title"
      })
      |> K8sElixirPostgres.Posts.create_post()

    post
  end
end
