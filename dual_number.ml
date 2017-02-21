module Dual = struct

  type t = float * float

  let from_floats a b : t = a, b

  let real (a, _ : t) = a

  let non_real (_, b : t) = b

  module Infix = struct

    let ( ! ) ((a, b) : t) : t =
      (a, -. b)

    let ( + ) ((a, b) : t) ((c, d) : t) : t =
      (a +. c, b +. d)

    let ( - ) ((a, b) : t) ((c, d) : t) : t =
      (a -. c, b -. d)

    let ( * ) ((a, b) : t) ((c, d) : t) : t =
      (a *. c, a*.d +. b*.c)

    let ( / ) ((a, b) : t) ((c, d) : t) : t =
      (a /. c, ((b*.c -. a*.d)/.(c*.c)))
  end

end
