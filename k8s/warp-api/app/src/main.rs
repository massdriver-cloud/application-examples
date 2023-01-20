use warp::{Filter, http::Response};
use tracing::info;
use tracing_subscriber;
use std::env;

#[tokio::main]
async fn main() {
    tracing_subscriber::fmt::init();

    let port = env::var("PORT").unwrap_or("3000".to_string()).parse::<u16>().unwrap();
    info!(port, "starting server");

    // Match any request
    let routes = warp::any().map(|| {
        info!("serving request");
        Response::builder()
            .body("Hello, World! My name is Rusty.")
    });

    warp::serve(routes).run(([0, 0, 0, 0], port)).await;
}
