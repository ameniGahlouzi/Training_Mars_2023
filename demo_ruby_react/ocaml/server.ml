open Cohttp
open Cohttp_lwt_unix
open Lwt

let articles = [
  { name = "Article 1"; id = "1" };
  { name = "Article 2"; id = "2" };
  { name = "Article 3"; id = "3" };
]

let article_list () =
  let body = Yojson.Safe.to_string (Yojson.Safe.from_list articles) in
  Lwt.return (Response.make ~status:`OK ~body:(Cohttp.Body.of_string body) ())

let server =
  let callback _conn req _body =
    match req with
    | { Request.meth = `GET; path = "/articles"; _ } ->
      article_list ()
    | _ ->
      Lwt.return (Response.make ~status:`Not_found ())
  in
  Server.create ~mode:(`TCP (`Port 8000)) (Server.make ~callback ())

let () =
  Lwt_main.run server
