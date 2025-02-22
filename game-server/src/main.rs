use axum::{
  extract::State,
  response::Html,
  routing::get,
  Router,
};
use game_core::WorldMap;
use game_web::WebRenderer;

#[derive(Clone)]
struct GameState {
  world: WorldMap,
}

#[tokio::main]
async fn main() {
  let state = GameState {
      world: WorldMap::new(10, 10),
  };

  let app = Router::new()
      .route("/", get(handler))
      .with_state(state);

  let listener = tokio::net::TcpListener::bind("127.0.0.1:3000")
      .await
      .unwrap();
  println!("listening on {}", listener.local_addr().unwrap());
  axum::serve(listener, app).await.unwrap();
}

async fn handler(State(state): State<GameState>) -> Html<String> {
  Html(WebRenderer::render_world(&state.world))
}
