module D : sig
  type t

  val value : (t -> t) -> (float -> float)
  val derivative : (t -> t) -> (float -> float)

  val val_deriv : (t -> t) -> (float -> float) * (float -> float)

  module Operators : sig
    val ( ~$ ) : float -> t
    val ( + ) : t -> t -> t
    val ( - ) : t -> t -> t
    val ( * ) : t -> t -> t
    val ( / ) : t -> t -> t
    val ( < ) : t -> t -> bool
    val ( = ) : t -> t -> bool
    val ( > ) : t -> t -> bool
    val ( <= ) : t -> t -> bool
    val ( >= ) : t -> t -> bool
    val ( <> ) : t -> t -> bool
    val sqrt : t -> t
    val ( ** ) : t -> float -> t
  end
end
