open Dual_number

module D = struct

  type t = Dual.t

  let variable x = Dual.from_floats x 1.

  let constant x = Dual.from_floats x 0.

  let value f = fun x ->
    variable x |> f |> Dual.real

  let derivative f = fun x ->
    variable x |> f |> Dual.non_real

  let val_deriv f =
    value f, derivative f

  module Operators = struct
    include Dual.Infix
    let ( ~$ ) = constant

    let ( < ) a b =
      Dual.real a < Dual.real b

    let ( = ) a b =
      Dual.real a = Dual.real b

    let ( > ) a b =
      Dual.real a > Dual.real b

    let ( <= ) a b =
      a = b || a < b

    let ( >= ) a b =
      a = b || a > b

    let ( <> ) a b =
      Dual.real a <> Dual.real b
  end

end
