use std::net::TcpListener;

use actix_web::dev::Server;
use actix_web::{web, App, HttpServer};
use sqlx::PgPool;

use crate::routes::greet;
use crate::routes::health_check;
use crate::routes::subscribe;
use tracing_actix_web::TracingLogger;

pub fn run(listener: TcpListener, db_pool: PgPool) -> Result<Server, std::io::Error> {
    // Wrap the pool in an Arc smart pointer
    let db_pool = web::Data::new(db_pool);

    let server = HttpServer::new(move || {
        // Note that order matters
        App::new()
            .wrap(TracingLogger) // Logger middleware
            .route("/health_check", web::get().to(health_check))
            .route("/", web::get().to(greet))
            .route("/{name}", web::get().to(greet))
            .route("/subscriptions", web::post().to(subscribe))
            // Our pool is already wrapped in an Arc pointer:
            // using .data would add another Arc pointer on top
            // of the existing one - an unnecessary indirection.
            // .app_data instead does not perform an additional layer of wrapping.
            .app_data(db_pool.clone())
    })
    .listen(listener)?
    .run();

    Ok(server)
}
