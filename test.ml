open Core_kernel.Std
open Auto_differentiate

let f, f' = D.val_deriv (fun x ->
    let open D.Operators in
    if x < ~$5.
    then ~$2. * x ** 2. - ~$3. * x + ~$5.
    else ~$5. / x + ~$39.)

let () =
  List.range 0 10 |>
  List.map ~f:Float.of_int |>
  List.iter ~f:(fun x ->
      printf "f(%f) = %f\n" x (f x);
      printf "f'(%f) = %f\n\n" x (f' x))
