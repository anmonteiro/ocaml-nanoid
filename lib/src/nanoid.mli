include module type of Nanoid_intf

val pseudo_seeded : string -> (module RNG)
(** [pseudo_seeded seed] is a [RNG] module that generates pseudo
   random numbers based on the given [seed]. It is subject to the same
   limitations as {!Cryptokit.Random.pseudo_rng} *)

(** [Make (Rng)] is a Nano ID generator based on random number generator [Rng] *)
module Make (Rng : RNG) : S

include S
(** The default Nano ID generator is based on the {!pseudo_seeded}
   random number generator seeded with the current system time as
   given by {!Unix.gettimeofday}. *)
