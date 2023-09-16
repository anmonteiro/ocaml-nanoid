let () =
  Mirage_crypto_rng_unix.initialize (module Mirage_crypto_rng.Fortuna);
  let open Alcotest in
  run "Nanoid"
    [ ("pseudo-seeded", [ test_case "generate" `Quick Tests.generate ]) ]
