include Versions.Intf

let alphabet =
  "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_"


module Simple () = struct
  let random_string n = Mirage_crypto_rng.generate n
  let nanoid ?(size = 21) () =
    let bytes = random_string size in
    String.init size (fun i ->
        alphabet.[String.get_uint8 bytes i land 0b00111111])
end
