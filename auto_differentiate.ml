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

    let sqrt a =
      let arsqrt = sqrt (Dual.real a) in
      let anr = Dual.non_real a in
      Dual.from_floats arsqrt (0.5 *. anr /. arsqrt)

    let ( ** ) a b =
      Dual.from_floats
        (Dual.real a ** b)
        (b *. Dual.non_real a *. (Dual.real a ** (b -. 1.)))


  end

end
