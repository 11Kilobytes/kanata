(define-module (kanata-package)
  #:use-module (gnu packages crates-io)
  #:use-module (guix build-system cargo)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module ((guix utils) #:select (current-source-directory))
  #:use-module (gnu packages crates-graphics))

(define vcs-file?
  ;; Return true if the given file is under version control.
  (or (git-predicate (dirname (dirname (current-source-directory))))
      (const #t)))

(define-public rust-simplelog-0.12
  (package
    (name "rust-simplelog")
    (version "0.12.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "simplelog" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0sa3hjdifxhcb9lnlg549fr2cc7vz89nygwbih2dbqsx3h20ivmc"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-ansi-term" ,rust-ansi-term-0.12)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-paris" ,rust-paris-1)
                       ("rust-termcolor" ,rust-termcolor-1)
                       ("rust-time" ,rust-time-0.3))))
    (home-page "https://github.com/drakulix/simplelog.rs")
    (synopsis "A simple and easy-to-use logging facility for Rust's log crate")
    (description
     "This package provides a simple and easy-to-use logging facility for Rust's log
crate")
    (license (list license:expat license:asl2.0))))

(define-public rust-sd-notify-0.4
  (package
    (name "rust-sd-notify")
    (version "0.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "sd-notify" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0clc887rjdz0796c1lsbwnrgmcis4b30gyy3qb4v8zg0yf03c7k2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/lnicola/sd-notify")
    (synopsis "Lightweight crate for systemd service state notifications")
    (description "Lightweight crate for systemd service state notifications")
    (license (list license:expat license:asl2.0))))

(define-public rust-stretch-0.3
  (package
    (name "rust-stretch")
    (version "0.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "stretch" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "11vdmli145j6yakgr7hkzgbnz1kqsb9rq3zrxl1g6dz11k9cc3bv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-libm" ,rust-libm-0.1))))
    (home-page "https://github.com/vislyhq/stretch")
    (synopsis "High performance & cross-platform Flexbox implementation")
    (description "High performance & cross-platform Flexbox implementation")
    (license license:expat)))

(define-public rust-newline-converter-0.2
  (package
    (name "rust-newline-converter")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "newline-converter" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "03y000bbxnwzb7aipxyw7gm68b1bd8dv7illz03l4qw7bjfx0w8z"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-unicode-segmentation" ,rust-unicode-segmentation-1))))
    (home-page
     "https://github.com/spitfire05/rnc/tree/master/crates/newline-converter")
    (synopsis "Newline byte converter library")
    (description "Newline byte converter library")
    (license license:expat)))

(define-public rust-muldiv-0.2
  (package
    (name "rust-muldiv")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "muldiv" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "014jlry2l2ph56mp8knw65637hh49q7fmrraim2bx9vz0a638684"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/sdroege/rust-muldiv")
    (synopsis
     "Provides a trait for numeric types to perform combined multiplication and
division with overflow protection
")
    (description
     "This package provides a trait for numeric types to perform combined
multiplication and division with overflow protection")
    (license license:expat)))

(define-public rust-native-windows-gui-1
  (package
    (name "rust-native-windows-gui")
    (version "1.0.13")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "native-windows-gui" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0m44lbslzvs04i4rgcphld23qlwf9zzlzmspgimyp3gnd6k06w2g"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-1)
                       ("rust-lazy-static" ,rust-lazy-static-1)
                       ("rust-muldiv" ,rust-muldiv-0.2)
                       ("rust-newline-converter" ,rust-newline-converter-0.2)
                       ("rust-plotters" ,rust-plotters-0.3)
                       ("rust-plotters-backend" ,rust-plotters-backend-0.3)
                       ("rust-raw-window-handle" ,rust-raw-window-handle-0.3)
                       ("rust-stretch" ,rust-stretch-0.3)
                       ("rust-winapi" ,rust-winapi-0.3)
                       ("rust-winapi-build" ,rust-winapi-build-0.1))))
    (home-page "https://github.com/gabdube/native-windows-gui")
    (synopsis
     "A rust library to develop native GUI applications on the desktop for Microsoft Windows. Native-windows-gui wraps the native win32 window controls in a rustic API")
    (description
     "This package provides a rust library to develop native GUI applications on the
desktop for Microsoft Windows.  Native-windows-gui wraps the native win32 window
controls in a rustic API")
    (license license:expat)))

(define-public rust-thiserror-impl-1
  (package
    (name "rust-thiserror-impl")
    (version "1.0.50")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "thiserror-impl" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1f0lmam4765sfnwr4b1n00y14vxh10g0311mkk0adr80pi02wsr6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://github.com/dtolnay/thiserror")
    (synopsis "Implementation detail of the `thiserror` crate")
    (description "Implementation detail of the `thiserror` crate")
    (license (list license:expat license:asl2.0))))

(define-public rust-thiserror-1
  (package
    (name "rust-thiserror")
    (version "1.0.50")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "thiserror" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1ll2sfbrxks8jja161zh1pgm3yssr7aawdmaa2xmcwcsbh7j39zr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-thiserror-impl" ,rust-thiserror-impl-1))))
    (home-page "https://github.com/dtolnay/thiserror")
    (synopsis "derive(Error)")
    (description "derive(Error)")
    (license (list license:expat license:asl2.0))))

(define-public rust-supports-unicode-2
  (package
    (name "rust-supports-unicode")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "supports-unicode" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1xxscsdjmdp7i3ikqnnivfn4hnpy4gp9as4hshgd4pdb82r2qv2b"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-is-terminal" ,rust-is-terminal-0.4))))
    (home-page "https://github.com/zkat/supports-unicode")
    (synopsis "Detects whether a terminal supports unicode.")
    (description "Detects whether a terminal supports unicode.")
    (license license:asl2.0)))

(define-public rust-supports-hyperlinks-2
  (package
    (name "rust-supports-hyperlinks")
    (version "2.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "supports-hyperlinks" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0g93nh1db3f9lyd0ry35bqjrxkg6sbysn36x9hgd9m5h5rlk2hpq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-is-terminal" ,rust-is-terminal-0.4))))
    (home-page "https://github.com/zkat/supports-hyperlinks")
    (synopsis "Detects whether a terminal supports rendering hyperlinks.")
    (description "Detects whether a terminal supports rendering hyperlinks.")
    (license license:asl2.0)))

(define-public rust-miette-derive-5
  (package
    (name "rust-miette-derive")
    (version "5.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "miette-derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0p33msrngkxlp5ajm8nijamii9vcwwpy8gfh4m53qnmrc0avrrs9"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://github.com/zkat/miette")
    (synopsis "Derive macros for miette. Like `thiserror` for Diagnostics.")
    (description
     "Derive macros for miette.  Like `thiserror` for Diagnostics.")
    (license license:asl2.0)))

(define-public rust-backtrace-ext-0.2
  (package
    (name "rust-backtrace-ext")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "backtrace-ext" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0l4xacjnx4jrn9k14xbs2swks018mviq03sp7c1gn62apviywysk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-backtrace" ,rust-backtrace-0.3))))
    (home-page "https://github.com/gankra/backtrace-ext")
    (synopsis "minor conveniences on top of the backtrace crate")
    (description "minor conveniences on top of the backtrace crate")
    (license (list license:expat license:asl2.0))))

(define-public rust-miette-5
  (package
    (name "rust-miette")
    (version "5.10.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "miette" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0vl5qvl3bgha6nnkdl7kiha6v4ypd6d51wyc4q1bvdpamr75ifsr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-backtrace" ,rust-backtrace-0.3)
                       ("rust-backtrace-ext" ,rust-backtrace-ext-0.2)
                       ("rust-is-terminal" ,rust-is-terminal-0.4)
                       ("rust-miette-derive" ,rust-miette-derive-5)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-owo-colors" ,rust-owo-colors-3)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-supports-color" ,rust-supports-color-2)
                       ("rust-supports-hyperlinks" ,rust-supports-hyperlinks-2)
                       ("rust-supports-unicode" ,rust-supports-unicode-2)
                       ("rust-terminal-size" ,rust-terminal-size-0.1)
                       ("rust-textwrap" ,rust-textwrap-0.15)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-unicode-width" ,rust-unicode-width-0.1))))
    (home-page "https://github.com/zkat/miette")
    (synopsis
     "Fancy diagnostic reporting library and protocol for us mere mortals who aren't compiler hackers.")
    (description
     "Fancy diagnostic reporting library and protocol for us mere mortals who aren't
compiler hackers.")
    (license license:asl2.0)))

(define-public rust-kanata-parser-0.150.3
  (package
    (name "rust-kanata-parser")
    (version "0.150.3")
    (source
     (local-file "../../parser" "kanata-parser-checkout"
                 #:recursive? #t
                 #:select? vcs-file?))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-kanata-keyberon" ,rust-kanata-keyberon-0.150.3)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-miette" ,rust-miette-5)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-parking-lot" ,rust-parking-lot-0.12)
                       ("rust-radix-trie" ,rust-radix-trie-0.2)
                       ("rust-rustc-hash" ,rust-rustc-hash-1)
                       ("rust-thiserror" ,rust-thiserror-1))))
    (home-page "https://github.com/jtroo/kanata")
    (synopsis
     "A parser for configuration language of kanata, a keyboard remapper.")
    (description
     "This package provides a parser for configuration language of kanata, a keyboardremapper.")
    (license license:lgpl3)))

(define-public rust-kanata-keyberon-macros-0.2
  (package
    (name "rust-kanata-keyberon-macros")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "kanata-keyberon-macros" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0lj7ldiazmszh0k01h7mjzhjg59bdakvx2pnpc9mq2ir0czzixkk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1))))
    (home-page "")
    (synopsis "Macros for keyberon. Fork for kanata project")
    (description "Macros for keyberon.  Fork for kanata project")
    (license license:expat)))

(define-public rust-atomic-polyfill-0.1
  (package
    (name "rust-atomic-polyfill")
    (version "0.1.11")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "atomic-polyfill" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0a4vd4zq75xmwbi33flf35qmm2nf99kx3hx2m21lslqnyfrpxzz3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-critical-section" ,rust-critical-section-1))))
    (home-page "https://github.com/embassy-rs/atomic-polyfill")
    (synopsis "Atomic polyfills, for targets where they're not available.")
    (description "Atomic polyfills, for targets where they're not available.")
    (license (list license:expat license:asl2.0))))

(define-public rust-heapless-0.7
  (package
    (name "rust-heapless")
    (version "0.7.16")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "heapless" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0hq7ifnzpdj9rc06rhys4qa3qkr6q3k01kwfca0ak7lbl4jbq16v"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-atomic-polyfill" ,rust-atomic-polyfill-0.1)
                       ("rust-atomic-polyfill" ,rust-atomic-polyfill-0.1)
                       ("rust-atomic-polyfill" ,rust-atomic-polyfill-0.1)
                       ("rust-defmt" ,rust-defmt-0.3)
                       ("rust-hash32" ,rust-hash32-0.2)
                       ("rust-rustc-version" ,rust-rustc-version-0.4)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-spin" ,rust-spin-0.9)
                       ("rust-stable-deref-trait" ,rust-stable-deref-trait-1)
                       ("rust-ufmt-write" ,rust-ufmt-write-0.1))))
    (home-page "https://github.com/japaric/heapless")
    (synopsis
     "`static` friendly data structures that don't require dynamic memory allocation")
    (description
     "`static` friendly data structures that don't require dynamic memory allocation")
    (license (list license:expat license:asl2.0))))

(define-public rust-arraydeque-0.4
  (package
    (name "rust-arraydeque")
    (version "0.4.5")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "arraydeque" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1n4appvjfrmxkc4x0v8ivpzwqf1z6pqx2caxk98116fqkgbd7zzh"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-generic-array" ,rust-generic-array-0.12))))
    (home-page "https://github.com/andylokandy/arraydeque")
    (synopsis
     "A ring buffer with a fixed capacity, which can be stored on the stack.")
    (description
     "This package provides a ring buffer with a fixed capacity, which can be stored
on the stack.")
    (license (list license:expat license:asl2.0))))

(define-public rust-kanata-keyberon-0.150.3
  (package
    (name "rust-kanata-keyberon")
    (version "0.150.3")
    (source
     (local-file "../../keyberon" "kanata-keyberon-checkout"
                 #:recursive? #t
                 #:select? vcs-file?))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-arraydeque" ,rust-arraydeque-0.4)
                       ("rust-heapless" ,rust-heapless-0.7)
                       ("rust-kanata-keyberon-macros" ,rust-kanata-keyberon-macros-0.2))))
    (home-page "https://github.com/TeXitoi/keyberon")
    (synopsis
     "Pure Rust keyboard firmware. Fork intended for use with kanata.")
    (description
     "Pure Rust keyboard firmware.  Fork intended for use with kanata.")
    (license license:expat)))

(define-public rust-num-enum-derive-0.6
  (package
    (name "rust-num-enum-derive")
    (version "0.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "num_enum_derive" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "19k57c0wg56vzzj2w77jsi8nls1b8xh8pvpzjnrgf8d9cnvpsrln"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro-crate" ,rust-proc-macro-crate-1)
                       ("rust-proc-macro2" ,rust-proc-macro2-1)
                       ("rust-quote" ,rust-quote-1)
                       ("rust-syn" ,rust-syn-2))))
    (home-page "https://github.com/illicitonion/num_enum")
    (synopsis
     "Internal implementation details for ::num_enum (Procedural macros to make inter-operation between primitives and enums easier)")
    (description
     "Internal implementation details for ::num_enum (Procedural macros to make
inter-operation between primitives and enums easier)")
    (license (list license:bsd-3 license:expat license:asl2.0))))

(define-public rust-num-enum-0.6
  (package
    (name "rust-num-enum")
    (version "0.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "num_enum" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "18bna04g6zq978z2b4ygz0f8pbva37id4xnpgwh8l41w1m1mn0bs"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-num-enum-derive" ,rust-num-enum-derive-0.6))))
    (home-page "https://github.com/illicitonion/num_enum")
    (synopsis
     "Procedural macros to make inter-operation between primitives and enums easier.")
    (description
     "Procedural macros to make inter-operation between primitives and enums easier.")
    (license (list license:bsd-3 license:expat license:asl2.0))))

(define-public rust-interception-sys-0.1
  (package
    (name "rust-interception-sys")
    (version "0.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "interception-sys" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1lgwbml7gzq5a5rriy708w68gx6yiw9cdg7xy2c5vsrrck7pbs5b"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/bozbez/interception-sys")
    (synopsis "FFI bindings for Interception")
    (description "FFI bindings for Interception")
    (license license:lgpl3)))

(define-public rust-kanata-interception-0.2
  (package
    (name "rust-kanata-interception")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "kanata-interception" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0kpl88nnjp6v4nb9zl5s3vy9k2bjyc2x06mjf5499iqyappqygg4"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitflags" ,rust-bitflags-1)
                       ("rust-interception-sys" ,rust-interception-sys-0.1)
                       ("rust-num-enum" ,rust-num-enum-0.6)
                       ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/jtroo/kanata")
    (synopsis "Safe wrapper for Interception. Forked for use with kanata.")
    (description "Safe wrapper for Interception.  Forked for use with kanata.")
    (license (list license:expat license:asl2.0))))

(define-public rust-evdev-0.12
  (package
    (name "rust-evdev")
    (version "0.12.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "evdev" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0z3mknalm6rdfrhw3gq39l0bk671rsvixwx4y50fhg3wbm2250g7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bitvec" ,rust-bitvec-1)
                       ("rust-cfg-if" ,rust-cfg-if-1)
                       ("rust-futures-core" ,rust-futures-core-0.3)
                       ("rust-libc" ,rust-libc-0.2)
                       ("rust-nix" ,rust-nix-0.23)
                       ("rust-paste" ,rust-paste-1)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-thiserror" ,rust-thiserror-1)
                       ("rust-tokio" ,rust-tokio-1))))
    (home-page "https://github.com/cmr/evdev")
    (synopsis "evdev interface for Linux")
    (description "evdev interface for Linux")
    (license (list license:asl2.0 license:expat))))

(define-public rust-karabiner-driverkit-0.1
  (package
    (name "rust-karabiner-driverkit")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "karabiner-driverkit" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0s37gfzzzymf5cd68w9f17vginc2c07qwj15rxk49pi37cj3443g"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-cc" ,rust-cc-1))))
    (home-page "https://github.com/Psych3r/driverkit")
    (synopsis
     "Minimal Karabiner-DriverKit-VirtualHIDDevice wrapper for kanata")
    (description
     "Minimal Karabiner-@code{DriverKit-VirtualHIDDevice} wrapper for kanata")
    (license license:lgpl3)))

(define-public rust-termcolor-1
  (package
    (name "rust-termcolor")
    (version "1.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "termcolor" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0mbpflskhnz3jf312k50vn0hqbql8ga2rk0k79pkgchip4q4vcms"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs (("rust-winapi-util" ,rust-winapi-util-0.1))))
    (home-page "https://github.com/BurntSushi/termcolor")
    (synopsis
     "A simple cross platform library for writing colored text to a terminal.
")
    (description
     "This package provides a simple cross platform library for writing colored text
to a terminal.")
    (license (list license:unlicense license:expat))))

(define-public kanata
  (package
    (name "kanata")
    (version "1.5.0-git")
    (source
     (local-file "../.." "kanata-checkout"
                 #:recursive? #t
                 #:select? vcs-file?))
    (build-system cargo-build-system)
    (arguments
     `(#:install-source? #f
       #:cargo-inputs (("rust-anyhow" ,rust-anyhow-1)
                       ("rust-clap" ,rust-clap-4)
                       ("rust-dirs" ,rust-dirs-5)
                       ("rust-encode-unicode" ,rust-encode-unicode-0.3)
                       ("rust-evdev" ,rust-evdev-0.12)
                       ("rust-inotify" ,rust-inotify-0.10)
                       ("rust-is-terminal" ,rust-is-terminal-0.4)
                       ("rust-kanata-interception" ,rust-kanata-interception-0.2)
                       ("rust-kanata-keyberon" ,rust-kanata-keyberon-0.150.3)
                       ("rust-kanata-parser" ,rust-kanata-parser-0.150.3)
                       ("rust-karabiner-driverkit" ,rust-karabiner-driverkit-0.1)
                       ("rust-log" ,rust-log-0.4)
                       ("rust-miette" ,rust-miette-5)
                       ("rust-mio" ,rust-mio-0.8)
                       ("rust-native-windows-gui" ,rust-native-windows-gui-1)
                       ("rust-nix" ,rust-nix-0.26)
                       ("rust-once-cell" ,rust-once-cell-1)
                       ("rust-parking-lot" ,rust-parking-lot-0.12)
                       ("rust-radix-trie" ,rust-radix-trie-0.2)
                       ("rust-rustc-hash" ,rust-rustc-hash-1)
                       ("rust-sd-notify" ,rust-sd-notify-0.4)
                       ("rust-serde" ,rust-serde-1)
                       ("rust-serde-derive" ,rust-serde-derive-1)
                       ("rust-serde-json" ,rust-serde-json-1)
                       ("rust-signal-hook" ,rust-signal-hook-0.3)
                       ("rust-simplelog" ,rust-simplelog-0.12)
                       ("rust-termcolor" ,rust-termcolor-1)
                       ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/jtroo/kanata")
    (synopsis "Multi-layer keyboard customization")
    (description "Multi-layer keyboard customization")
    (license license:lgpl3)))
kanata
