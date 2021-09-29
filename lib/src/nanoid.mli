(** [nanoid ?size ()] generates a random Nano ID of size [size], which defaults
    to 21. *)
val nanoid : ?size:int -> unit -> string
