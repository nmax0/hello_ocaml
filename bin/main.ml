let secret_num = 42 (* i'll to change to a random method later when i figure how it actually works *)

let rec guess () = (* recursive function named guess *)
  print_endline "guess the number between 1 and 100:";
  let input = read_line () in
  try
    let user_guess = int_of_string input in
    if user_guess < 1 || user_guess > 100 then
      (print_endline "cant u read, between 1 and 100"; guess()) (* call back the function *)
    else if user_guess = secret_num then
      print_endline "wow, u guessed the correct number"
    else if user_guess > secret_num then
      (print_endline "too high"; guess())
    else
      (print_endline "too low"; guess())
  with
  | Failure _ -> (* dont need to collect the error*)
     print_endline "a valid num please"; guess()

let () = guess () (* first call the function *)
