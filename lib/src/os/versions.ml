module Intf = struct
  (** Random bytes generator *)
  module type RNG = sig
    (** [random_bytes size] returns a buffer and a offset at which [size] fresh
        random bytes are readable. *)
    val random_bytes : int -> bytes
  end

  (** Nano ID generator *)
  module type S = sig
    (** [nanoid ?size ()] generates a random Nano ID of size [size], which
        defaults to 21. *)
    val nanoid : ?size:int -> unit -> string
  end
end

module type VERSION_1_0 = sig
  (** @inline *)
  include module type of Intf

  (** [Simple ()] is a Nano ID generator based on the {!pseudo_seeded} random
      number generator seeded with the current system time as given by
      {!Unix.gettimeofday}. *)
  module Simple () : S
end
