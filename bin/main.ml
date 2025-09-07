(* 2 hours later i've barelly figured out this random library and ocaml seperators work *)

Random.self_init () (* rng init *)
let secret_num = (Random.int 100) + 1 (* 0..99 → 1..100 *)

(* debug line *)
(* let () = Printf.printf "secret num: %d\n" secret_num *)

let rec guess () =
  print_string "guess: ";
  let input = read_line () in
  try
    let user_guess = int_of_string input in
    if user_guess < 1 || user_guess > 100 then begin
      print_endline "look at the range";
      guess () end
    else if user_guess = secret_num then begin
      print_endline "well played" end
    else if user_guess < secret_num then begin
      print_endline "higher";
      guess () end
    else begin
      print_endline "lower";
      guess () end
  with
  | Failure _ ->
     print_endline "enter a valid int please";
     guess ()

let () = guess ()

