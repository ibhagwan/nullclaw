//! Minimal libpq C bindings.
//!
//! Zig 0.17 removed `@cImport`; this file declares the subset of libpq used by
//! the PostgreSQL memory and pgvector backends.

pub const PGconn = opaque {};
pub const PGresult = opaque {};

pub const CONNECTION_OK: c_int = 0;
pub const PGRES_COMMAND_OK: c_int = 1;
pub const PGRES_TUPLES_OK: c_int = 2;

pub extern "c" fn PQconnectdb(conninfo: [*:0]const u8) ?*PGconn;
pub extern "c" fn PQstatus(conn: ?*const PGconn) c_int;
pub extern "c" fn PQfinish(conn: ?*PGconn) void;
pub extern "c" fn PQexec(conn: ?*PGconn, query: [*:0]const u8) ?*PGresult;
pub extern "c" fn PQexecParams(
    conn: ?*PGconn,
    command: [*:0]const u8,
    n_params: c_int,
    param_types: ?*const anyopaque,
    param_values: ?*const anyopaque,
    param_lengths: ?*const anyopaque,
    param_formats: ?*const anyopaque,
    result_format: c_int,
) ?*PGresult;
pub extern "c" fn PQresultStatus(result: ?*const PGresult) c_int;
pub extern "c" fn PQntuples(result: ?*const PGresult) c_int;
pub extern "c" fn PQgetvalue(result: ?*const PGresult, row: c_int, col: c_int) [*c]const u8;
pub extern "c" fn PQgetisnull(result: ?*const PGresult, row: c_int, col: c_int) c_int;
pub extern "c" fn PQgetlength(result: ?*const PGresult, row: c_int, col: c_int) c_int;
pub extern "c" fn PQcmdTuples(result: ?*const PGresult) [*c]const u8;
pub extern "c" fn PQclear(result: ?*PGresult) void;
