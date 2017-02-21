module Dual : sig

  type t

  val from_floats : float -> float -> t

  val real : t -> float
  val non_real : t -> float

  module Infix : sig
    val ( ! ) : t -> t
    val ( + ) : t -> t -> t
    val ( - ) : t -> t -> t
    val ( * ) : t -> t -> t
    val ( / ) : t -> t -> t
  end
end
