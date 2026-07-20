;;; SPDX-FileCopyrightText: 2025 Hilton Chain <hako@ultrarare.space>
;;; SPDX-FileCopyrightText: 2025-2026 Nikita Mitasov <me@ch4og.com>
;;; SPDX-License-Identifier: GPL-3.0-or-later

(define-module (shika packages rust-crates)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system cargo)
  #:export (lookup-cargo-inputs))

;;;
;;; This file is managed by ‘guix import’.  DO NOT add definitions manually.
;;;

;;;
;;; Rust dependencies fetched from crates.io and non-workspace development
;;; snapshots.
;;;

(define qqqq-separator 'begin-of-crates)

(define rust-addr2line-0.24.2
  (crate-source "addr2line" "0.24.2"
                "1hd1i57zxgz08j6h5qrhsnm2fi0bcqvsh389fw400xm3arz2ggnz"))

(define rust-addr2line-0.25.1
  (crate-source "addr2line" "0.25.1"
                "0jwb96gv17vdr29hbzi0ha5q6jkpgjyn7rjlg5nis65k41rk0p8v"))

(define rust-adler2-2.0.1
  (crate-source "adler2" "2.0.1"
                "1ymy18s9hs7ya1pjc9864l30wk8p2qfqdi7mhhcc5nfakxbij09j"))

(define rust-aes-0.8.4
  (crate-source "aes" "0.8.4"
                "1853796anlwp4kqim0s6wm1srl4ib621nm0cl2h3c8klsjkgfsdi"))

(define rust-aho-corasick-1.1.3
  (crate-source "aho-corasick" "1.1.3"
                "05mrpkvdgp5d20y2p989f187ry9diliijgwrs254fs9s1m1x6q4f"))

(define rust-aho-corasick-1.1.4
  (crate-source "aho-corasick" "1.1.4"
                "00a32wb2h07im3skkikc495jvncf62jl6s96vwc7bhi70h9imlyx"))

(define rust-aligned-0.4.3
  (crate-source "aligned" "0.4.3"
                "1186lhb3gb4x6spzw7ff0zcraa8cr9zqk4ldpm5g1vb2ijc0higf"))

(define rust-aligned-vec-0.6.4
  (crate-source "aligned-vec" "0.6.4"
                "16vnf78hvfix5cwzd5xs5a2g6afmgb4h7n6yfsc36bv0r22072fw"))

(define rust-allocator-api2-0.2.21
  (crate-source "allocator-api2" "0.2.21"
                "08zrzs022xwndihvzdn78yqarv2b9696y67i6h78nla3ww87jgb8"))

(define rust-alsa-0.10.0
  (crate-source "alsa" "0.10.0"
                "1hy518kcxsrna0l4i0bbchd8jslbq5m2w7hf4lk2n8rvw6ydp23w"))

(define rust-alsa-0.9.1
  (crate-source "alsa" "0.9.1"
                "0hvxc447bsynyhzhmznw6w2kwbid83p712dls4h1x8w3pavp4xgd"))

(define rust-alsa-sys-0.3.1
  ;; TODO: Check bundled sources.
  (crate-source "alsa-sys" "0.3.1"
                "09qmmnpmlcj23zcgx2xsi4phcgm5i02g9xaf801y7i067mkfx3yv"))

(define rust-android-system-properties-0.1.5
  (crate-source "android_system_properties" "0.1.5"
                "04b3wrz12837j7mdczqd95b732gw5q7q66cv4yn4646lvccp57l1"))

(define rust-annotate-snippets-0.11.5
  (crate-source "annotate-snippets" "0.11.5"
                "1i1bmr5vy957l8fvivj9x1xs24np0k56rdgwj0bxqk45b2p8w3ki"))

(define rust-anstream-0.6.20
  (crate-source "anstream" "0.6.20"
                "14k1iqdf3dx7hdjllmql0j9sjxkwr1lfdddi3adzff0r7mjn7r9s"))

(define rust-anstream-0.6.21
  (crate-source "anstream" "0.6.21"
                "0jjgixms4qjj58dzr846h2s29p8w7ynwr9b9x6246m1pwy0v5ma3"))

(define rust-anstyle-1.0.11
  (crate-source "anstyle" "1.0.11"
                "1gbbzi0zbgff405q14v8hhpi1kz2drzl9a75r3qhks47lindjbl6"))

(define rust-anstyle-1.0.13
  (crate-source "anstyle" "1.0.13"
                "0y2ynjqajpny6q0amvfzzgw0gfw3l47z85km4gvx87vg02lcr4ji"))

(define rust-anstyle-parse-0.2.7
  (crate-source "anstyle-parse" "0.2.7"
                "1hhmkkfr95d462b3zf6yl2vfzdqfy5726ya572wwg8ha9y148xjf"))

(define rust-anstyle-query-1.1.4
  (crate-source "anstyle-query" "1.1.4"
                "1qir6d6fl5a4y2gmmw9a5w93ckwx6xn51aryd83p26zn6ihiy8wy"))

(define rust-anstyle-query-1.1.5
  (crate-source "anstyle-query" "1.1.5"
                "1p6shfpnbghs6jsa0vnqd8bb8gd7pjd0jr7w0j8jikakzmr8zi20"))

(define rust-anstyle-wincon-3.0.10
  (crate-source "anstyle-wincon" "3.0.10"
                "0ajz9wsf46a2l3pds7v62xbhq2cffj7wrilamkx2z8r28m0k61iy"))

(define rust-anstyle-wincon-3.0.11
  (crate-source "anstyle-wincon" "3.0.11"
                "0zblannm70sk3xny337mz7c6d8q8i24vhbqi42ld8v7q1wjnl7i9"))

(define rust-anyhow-1.0.100
  (crate-source "anyhow" "1.0.100"
                "0qbfmw4hhv2ampza1csyvf1jqjs2dgrj29cv3h3sh623c6qvcgm2"))

(define rust-anyhow-1.0.101
  (crate-source "anyhow" "1.0.101"
                "1skmg90fnjnlgs3vl7bksw7036d3rqwqj20n2fxd2ppg67p0y3jz"))

(define rust-anyhow-1.0.104
  (crate-source "anyhow" "1.0.104"
                "0w34jjcm02p5g9kvsjr1dvpw0zs2fi7igi6nr414fkm5gz85w2ik"))

(define rust-anyhow-1.0.98
  (crate-source "anyhow" "1.0.98"
                "11ylvjdrcjs0q9jgk1af4r5cx1qppj63plxqkq595vmc24rjsvg1"))

(define rust-approx-0.5.1
  (crate-source "approx" "0.5.1"
                "1ilpv3dgd58rasslss0labarq7jawxmivk17wsh8wmkdm3q15cfa"))

(define rust-arbitrary-1.4.1
  (crate-source "arbitrary" "1.4.1"
                "08zj2yanll5s5gsbmvgwvbq39iqzy3nia3yx3db3zwba08yhpqnx"))

(define rust-arbitrary-1.4.2
  (crate-source "arbitrary" "1.4.2"
                "1wcbi4x7i3lzcrkjda4810nqv03lpmvfhb0a85xrq1mbqjikdl63"))

(define rust-arboard-3.6.1
  (crate-source "arboard" "3.6.1"
                "1byx6q5iipxkb0pyjp80k7c4akp4n5m7nsmqdbz4n7s9ak0a2j03"))

(define rust-arg-enum-proc-macro-0.3.4
  (crate-source "arg_enum_proc_macro" "0.3.4"
                "1sjdfd5a8j6r99cf0bpqrd6b160x9vz97y5rysycsjda358jms8a"))

(define rust-argon2-0.5.3
  (crate-source "argon2" "0.5.3"
                "0wn0kk97k49wxidfigmz1pdqmygqzi4h6w72ib7cpq765s4i0diw"))

(define rust-argparse-0.2.2
  (crate-source "argparse" "0.2.2"
                "0iqy2jkifwq0azrrh26qjssp7sknjylycq35jkalzb744xcbz3iz"))

(define rust-array-init-2.1.0
  (crate-source "array-init" "2.1.0"
                "1z0bh6grrkxlbknq3xyipp42rasngi806y92fiddyb2n99lvfqix"))

(define rust-arraydeque-0.5.1
  (crate-source "arraydeque" "0.5.1"
                "0dn2xdfg3rkiqsh8a6achnmvf5nf11xk33xgjzpksliab4yjx43x"))

(define rust-arrayref-0.3.9
  (crate-source "arrayref" "0.3.9"
                "1jzyp0nvp10dmahaq9a2rnxqdd5wxgbvp8xaibps3zai8c9fi8kn"))

(define rust-arrayvec-0.7.6
  (crate-source "arrayvec" "0.7.6"
                "0l1fz4ccgv6pm609rif37sl5nv5k6lbzi7kkppgzqzh1vwix20kw"))

(define rust-arrayvec-0.7.8
  (crate-source "arrayvec" "0.7.8"
                "0mmd8lrijbvg1qp4c5zis5dq41a3mjv2rb6bxkyj9kwaw2k6gyyk"))

(define rust-as-slice-0.2.1
  (crate-source "as-slice" "0.2.1"
                "05j52y1ws8kir5zjxnl48ann0if79sb56p9nm76hvma01r7nnssi"))

(define rust-assert-cmd-2.1.1
  (crate-source "assert_cmd" "2.1.1"
                "11dz6ljl8v9alh6mcbhdp0niibgxraxhibs24i1y1a8aacj6kfxw"))

(define rust-async-broadcast-0.7.2
  (crate-source "async-broadcast" "0.7.2"
                "0ckmqcwyqwbl2cijk1y4r0vy60i89gqc86ijrxzz5f2m4yjqfnj3"))

(define rust-async-channel-2.5.0
  (crate-source "async-channel" "2.5.0"
                "1ljq24ig8lgs2555myrrjighycpx2mbjgrm3q7lpa6rdsmnxjklj"))

(define rust-async-executor-1.13.3
  (crate-source "async-executor" "1.13.3"
                "1f3za9v8wkqzv6rz69g0qzvdcmghwbixijwzldwjm9w3zph00z29"))

(define rust-async-io-2.6.0
  (crate-source "async-io" "2.6.0"
                "1z16s18bm4jxlmp6rif38mvn55442yd3wjvdfhvx4hkgxf7qlss5"))

(define rust-async-lock-3.4.2
  (crate-source "async-lock" "3.4.2"
                "04c3xrrdrfrvh9v0ajxrangpy38qi76qq268zslphnxxjqjpy3r9"))

(define rust-async-process-2.5.0
  (crate-source "async-process" "2.5.0"
                "0xfswxmng6835hjlfhv7k0jrfp7czqxpfj6y2s5dsp05q0g94l7w"))

(define rust-async-recursion-1.1.1
  (crate-source "async-recursion" "1.1.1"
                "04ac4zh8qz2xjc79lmfi4jlqj5f92xjvfaqvbzwkizyqd4pl4hrv"))

(define rust-async-signal-0.2.13
  (crate-source "async-signal" "0.2.13"
                "0k66mpb3xp86hj4vxs7w40v7qz2jfbblrm9ddc5mglwwynxp1h23"))

(define rust-async-stream-0.3.6
  (crate-source "async-stream" "0.3.6"
                "0xl4zqncrdmw2g6241wgr11dxdg4h7byy6bz3l6si03qyfk72nhb"))

(define rust-async-stream-impl-0.3.6
  (crate-source "async-stream-impl" "0.3.6"
                "0kaplfb5axsvf1gfs2gk6c4zx6zcsns0yf3ssk7iwni7bphlvhn7"))

(define rust-async-task-4.7.1
  (crate-source "async-task" "4.7.1"
                "1pp3avr4ri2nbh7s6y9ws0397nkx1zymmcr14sq761ljarh3axcb"))

(define rust-async-trait-0.1.89
  (crate-source "async-trait" "0.1.89"
                "1fsxxmz3rzx1prn1h3rs7kyjhkap60i7xvi0ldapkvbb14nssdch"))

(define rust-atomic-refcell-0.1.13
  (crate-source "atomic_refcell" "0.1.13"
                "0z04ng59y22mwf315wamx78ybhjag0x6k7isc36hdgcv63c7rrj1"))

(define rust-atomic-waker-1.1.2
  (crate-source "atomic-waker" "1.1.2"
                "1h5av1lw56m0jf0fd3bchxq8a30xv0b4wv8s4zkp4s0i7mfvs18m"))

(define rust-autocfg-1.5.0
  (crate-source "autocfg" "1.5.0"
                "1s77f98id9l4af4alklmzq46f21c980v13z2r1pcxx6bqgw0d1n0"))

(define rust-autocfg-1.5.1
  (crate-source "autocfg" "1.5.1"
                "0lqasy5i30flcgih1b50kvsk6z32g09r1q4ql7q81pj6228jy0zj"))

(define rust-av-scenechange-0.14.1
  (crate-source "av-scenechange" "0.14.1"
                "1543y7riwcy4mmsgcalxcm3bnb41hvwiqiz774nbj68fq9vischg"))

(define rust-av1-grain-0.2.4
  (crate-source "av1-grain" "0.2.4"
                "1j409cf560kvhxzjs65ksnzbxz7k6sm5lywizan11ijvm0ngngjg"))

(define rust-av1-grain-0.2.5
  (crate-source "av1-grain" "0.2.5"
                "1y3p43i5xncbny0pfh8kw09am3l3mgyg82ln65r3f434443xpzcc"))

(define rust-avif-serialize-0.8.5
  (crate-source "avif-serialize" "0.8.5"
                "0hkb94flydcv8a5g9y1kk5nqfc6qa1agb5w1q28r2azdmi8yza1f"))

(define rust-avif-serialize-0.8.9
  (crate-source "avif-serialize" "0.8.9"
                "0f3z55fma6xmdj0a0x15vz91cqisiardrfgbjlwb2q6lyzjqy5z7"))

(define rust-axum-0.8.8
  (crate-source "axum" "0.8.8"
                "1f4p0m04mgwpn8b40i9r5mgqxk6w11sv4yri6xfqk305nhyayllb"))

(define rust-axum-core-0.5.5
  (crate-source "axum-core" "0.5.5"
                "08pa4752h96pai7j5avr2hnq35xh7qgv6vl57y1zhhnikkhnqi2r"))

(define rust-az-1.2.1
  (crate-source "az" "1.2.1"
                "0ww9k1w3al7x5qmb7f13v3s9c2pg1pdxbs8xshqy6zyrchj4qzkv"))

(define rust-az-1.3.0
  (crate-source "az" "1.3.0"
                "1xqkip7l4rnaaawrwf8jfnkvbx7d1xjnzsa30dk6rk6anw3v0pmy"))

(define rust-backtrace-0.3.75
  (crate-source "backtrace" "0.3.75"
                "00hhizz29mvd7cdqyz5wrj98vqkihgcxmv2vl7z0d0f53qrac1k8"))

(define rust-backtrace-0.3.76
  (crate-source "backtrace" "0.3.76"
                "1mibx75x4jf6wz7qjifynld3hpw3vq6sy3d3c9y5s88sg59ihlxv"))

(define rust-base16ct-0.2.0
  (crate-source "base16ct" "0.2.0"
                "1kylrjhdzk7qpknrvlphw8ywdnvvg39dizw9622w3wk5xba04zsc"))

(define rust-base32-0.5.1
  (crate-source "base32" "0.5.1"
                "0xp0a3xml25xw2bp5pyac2nld7vmmfjl02qynnyfn6aznfggwb82"))

(define rust-base64-0.22.1
  (crate-source "base64" "0.22.1"
                "1imqzgh7bxcikp5vx3shqvw9j09g9ly0xr0jma0q66i52r7jbcvj"))

(define rust-base64ct-1.8.1
  (crate-source "base64ct" "1.8.1"
                "12h6iwd0ib6xxwd0814wf3x6nd91r851xcycvlkpm199cii0y18f"))

(define rust-base64ct-1.8.3
  (crate-source "base64ct" "1.8.3"
                "01nyyyx84bhwrcc168hn47d8gvz2pzpv3y3lmck7mq4hw5vh3x9a"))

(define rust-bindgen-0.72.1
  (crate-source "bindgen" "0.72.1"
                "15bq73y3wd3x3vxh3z3g72hy08zs8rxg1f0i1xsrrd6g16spcdwr"))

(define rust-bit-field-0.10.2
  (crate-source "bit_field" "0.10.2"
                "0qav5rpm4hqc33vmf4vc4r0mh51yjx5vmd9zhih26n9yjs3730nw"))

(define rust-bit-field-0.10.3
  (crate-source "bit_field" "0.10.3"
                "1ikhbph4ap4w692c33r8bbv6yd2qxm1q3f64845grp1s6b3l0jqy"))

(define rust-bit-set-0.8.0
  (crate-source "bit-set" "0.8.0"
                "18riaa10s6n59n39vix0cr7l2dgwdhcpbcm97x1xbyfp1q47x008"))

(define rust-bit-vec-0.8.0
  (crate-source "bit-vec" "0.8.0"
                "1xxa1s2cj291r7k1whbxq840jxvmdsq9xgh7bvrxl46m80fllxjy"))

(define rust-bitflags-1.3.2
  (crate-source "bitflags" "1.3.2"
                "12ki6w8gn1ldq7yz9y680llwk5gmrhrzszaa17g1sbrw2r2qvwxy"))

(define rust-bitflags-2.10.0
  (crate-source "bitflags" "2.10.0"
                "1lqxwc3625lcjrjm5vygban9v8a6dlxisp1aqylibiaw52si4bl1"))

(define rust-bitflags-2.13.1
  (crate-source "bitflags" "2.13.1"
                "1nl76mpykmwmb8rq1l5vw1azdh1wvxdrnsk4sy3rdrzx01nvg25m"))

(define rust-bitflags-2.9.1
  (crate-source "bitflags" "2.9.1"
                "0rz9rpp5wywwqb3mxfkywh4drmzci2fch780q7lifbf6bsc5d3hv"))

(define rust-bitflags-2.9.4
  (crate-source "bitflags" "2.9.4"
                "157kkcv8s7vk6d17dar1pa5cqcz4c8pdrn16wm1ld7jnr86d2q92"))

(define rust-bitstream-io-2.6.0
  (crate-source "bitstream-io" "2.6.0"
                "1cli390l1dhp9skygyjjnqvczp36b7f31mkx9ry3dg26330cv6b0"))

(define rust-bitstream-io-4.10.0
  (crate-source "bitstream-io" "4.10.0"
                "07zxcy47l51k6vsxphzhgcnqyzl21pprs7212687c64s56z01zvy"))

(define rust-bitvec-1.0.1
  (crate-source "bitvec" "1.0.1"
                "173ydyj2q5vwj88k6xgjnfsshs4x9wbvjjv7sm0h36r34hn87hhv"))

(define rust-bitvec-1.1.1
  (crate-source "bitvec" "1.1.1"
                "0dqq44v9877q0xbl4g6aaaf3xhh3m1ca7ag0iy4l17ap5k8w7knx"))

(define rust-blake2-0.10.6
  (crate-source "blake2" "0.10.6"
                "1zlf7w7gql12v61d9jcbbswa3dw8qxsjglylsiljp9f9b3a2ll26"))

(define rust-block-buffer-0.10.4
  (crate-source "block-buffer" "0.10.4"
                "0w9sa2ypmrsqqvc20nhwr75wbb5cjr4kkyhpjm1z1lv2kdicfy1h"))

(define rust-block-padding-0.3.3
  (crate-source "block-padding" "0.3.3"
                "14wdad0r1qk5gmszxqd8cky6vx8qg7c153jv981mixzrpzmlz2d8"))

(define rust-block2-0.6.2
  (crate-source "block2" "0.6.2"
                "1xcfllzx6c3jc554nmb5qy6xmlkl6l6j5ib4wd11800n0n3rvsyd"))

(define rust-blocking-1.6.2
  (crate-source "blocking" "1.6.2"
                "08bz3f9agqlp3102snkvsll6wc9ag7x5m1xy45ak2rv9pq18sgz8"))

(define rust-bpaf-0.9.20
  (crate-source "bpaf" "0.9.20"
                "0caacci746fr7vh3x64fxi7zwqr3gi089lfddphb22v2m3bpcfa7"))

(define rust-bpaf-0.9.26
  (crate-source "bpaf" "0.9.26"
                "0vldd22dw3br4w0i1qqfsxj2vhs6imlfm9js38b01qp7fsc851hb"))

(define rust-bpaf-derive-0.5.17
  (crate-source "bpaf_derive" "0.5.17"
                "12k1w518xkly98fcsxifrmj7rmxah5hg48l9jc2if2csxkp4zyzy"))

(define rust-bpaf-derive-0.5.26
  (crate-source "bpaf_derive" "0.5.26"
                "150hx7x04w42i00zfwazzw22w65vcbdszq9wrdv91c9rx379hzig"))

(define rust-bstr-1.12.1
  (crate-source "bstr" "1.12.1"
                "1arc1v7h5l86vd6z76z3xykjzldqd5icldn7j9d3p7z6x0d4w133"))

(define rust-built-0.7.7
  (crate-source "built" "0.7.7"
                "0ywn0m11xm80pg6zrzq3sdj3vmzg3qs6baqnvfmkd377ly8n3van"))

(define rust-built-0.8.1
  (crate-source "built" "0.8.1"
                "1saq332pd6g3svvc9ah8myjpfvgqlzl2ksb1ypp3976kjcfm63jw"))

(define rust-bumpalo-3.19.0
  (crate-source "bumpalo" "3.19.0"
                "0hsdndvcpqbjb85ghrhska2qxvp9i75q2vb70hma9fxqawdy9ia6"))

(define rust-bumpalo-3.19.1
  (crate-source "bumpalo" "3.19.1"
                "044555i277xcinmqs7nnv8n5y4fqfi4l4lp1mp3i30vsidrxrnax"))

(define rust-bumpalo-3.20.3
  (crate-source "bumpalo" "3.20.3"
                "0jc6va3nwcqikm7chnpdv1s87my3gs2j7g1sc7g3k91brg3arxbj"))

(define rust-by-address-1.2.1
  (crate-source "by_address" "1.2.1"
                "01idmag3lcwnnqrnnyik2gmbrr34drsi97q15ihvcbbidf2kryk4"))

(define rust-bytemuck-1.23.1
  (crate-source "bytemuck" "1.23.1"
                "08ilqv7x5lckj82i41j5lx2is9krcxiibgrs9pispr245rwsaxjw"))

(define rust-bytemuck-1.24.0
  (crate-source "bytemuck" "1.24.0"
                "1x65wc9kwf0dfnmglkl8r46d29pfl7yilll5wh9bcf0g6a0gbg8z"))

(define rust-bytemuck-1.25.0
  (crate-source "bytemuck" "1.25.0"
                "1v1z32igg9zq49phb3fra0ax5r2inf3aw473vldnm886sx5vdvy8"))

(define rust-bytemuck-1.25.2
  (crate-source "bytemuck" "1.25.2"
                "15rp2m7j7kq22s76cbjwmrkd5r8lvacnm0mnrj013cnzka22x0wm"))

(define rust-bytemuck-derive-1.10.2
  (crate-source "bytemuck_derive" "1.10.2"
                "1zvmjmw1sdmx9znzm4dpbb2yvz9vyim8w6gp4z256l46qqdvvazr"))

(define rust-byteorder-1.5.0
  (crate-source "byteorder" "1.5.0"
                "0jzncxyf404mwqdbspihyzpkndfgda450l0893pz5xj685cg5l0z"))

(define rust-byteorder-lite-0.1.0
  (crate-source "byteorder-lite" "0.1.0"
                "15alafmz4b9az56z6x7glcbcb6a8bfgyd109qc3bvx07zx4fj7wg"))

(define rust-bytes-1.10.1
  (crate-source "bytes" "1.10.1"
                "0smd4wi2yrhp5pmq571yiaqx84bjqlm1ixqhnvfwzzc6pqkn26yp"))

(define rust-bytes-1.11.0
  (crate-source "bytes" "1.11.0"
                "1cww1ybcvisyj8pbzl4m36bni2jaz0narhczp1348gqbvkxh8lmk"))

(define rust-bytes-1.11.1
  (crate-source "bytes" "1.11.1"
                "0czwlhbq8z29wq0ia87yass2mzy1y0jcasjb8ghriiybnwrqfx0y"))

(define rust-cairo-rs-0.21.5
  (crate-source "cairo-rs" "0.21.5"
                "1r679k0wbrxa773cw207wmnhx8sypm4s7pmncbiay5mxq0sy27xh"))

(define rust-cairo-sys-rs-0.21.5
  (crate-source "cairo-sys-rs" "0.21.5"
                "0p14dpy8ar6gqi493nn04w5n7rp438km8icywfsma85iqs085hh6"))

(define rust-castaway-0.2.4
  (crate-source "castaway" "0.2.4"
                "0nn5his5f8q20nkyg1nwb40xc19a08yaj4y76a8q2y3mdsmm3ify"))

(define rust-cbc-0.1.2
  (crate-source "cbc" "0.1.2"
                "19l9y9ccv1ffg6876hshd123f2f8v7zbkc4nkckqycxf8fajmd96"))

(define rust-cc-1.2.29
  (crate-source "cc" "1.2.29"
                "0qlkaspjmywvjyfqhpv2x4kwrqs6b69zg33wfi2l8fg2im9rj5aw"))

(define rust-cc-1.2.38
  (crate-source "cc" "1.2.38"
                "1sg7gd94611qhryvb0iip0zibjnhf1yha2wnp0pw2mgrd3himx40"))

(define rust-cc-1.2.50
  (crate-source "cc" "1.2.50"
                "0g1q2k30bwnym5hlhk2y3k08hhrklgn68gr61b63f73s49ixal4z"))

(define rust-cc-1.2.51
  (crate-source "cc" "1.2.51"
                "00zj303al745qymzfx3qp4wnj5s5wncaadc8c64hbagi9zzyl2ks"))

(define rust-cc-1.2.53
  (crate-source "cc" "1.2.53"
                "0cjrx2nzlz8l93p4sfymjgsv0jicvfphd6hyhk5gyxbi2z72ypbm"))

(define rust-cc-1.2.54
  (crate-source "cc" "1.2.54"
                "10q5q3kzcqg9s1zrgpk9sn1a98xjnz177ixkkkx9qbfnpwdwhm33"))

(define rust-cc-1.2.55
  (crate-source "cc" "1.2.55"
                "0adx36r84c7rscv853a71nd3d5gsb1jf438gnl4syd5fah4nmcj7"))

(define rust-cc-1.3.0
  (crate-source "cc" "1.3.0"
                "1f27b93qhs65bjq04ljwgwxf8xq2qbba4j1k99cv9d9qav88i5f8"))

(define rust-cesu8-1.1.0
  (crate-source "cesu8" "1.1.0"
                "0g6q58wa7khxrxcxgnqyi9s1z2cjywwwd3hzr5c55wskhx6s0hvd"))

(define rust-cexpr-0.6.0
  (crate-source "cexpr" "0.6.0"
                "0rl77bwhs5p979ih4r0202cn5jrfsrbgrksp40lkfz5vk1x3ib3g"))

(define rust-cfg-aliases-0.2.1
  (crate-source "cfg_aliases" "0.2.1"
                "092pxdc1dbgjb6qvh83gk56rkic2n2ybm4yvy76cgynmzi3zwfk1"))

(define rust-cfg-expr-0.15.8
  (crate-source "cfg-expr" "0.15.8"
                "00lgf717pmf5qd2qsxxzs815v6baqg38d6m5i6wlh235p14asryh"))

(define rust-cfg-expr-0.20.6
  (crate-source "cfg-expr" "0.20.6"
                "0smbxbd39s2kpmz6r9yg4xmh0wx5d1in6amf49rpr0m6l6szbkkq"))

(define rust-cfg-if-1.0.1
  (crate-source "cfg-if" "1.0.1"
                "0s0jr5j797q1vqjcd41l0v5izlmlqm7lxy512b418xz5r65mfmcm"))

(define rust-cfg-if-1.0.3
  (crate-source "cfg-if" "1.0.3"
                "1afg7146gbxjvkbjx7i5sdrpqp9q5akmk9004fr8rsm90jf2il9g"))

(define rust-cfg-if-1.0.4
  (crate-source "cfg-if" "1.0.4"
                "008q28ajc546z5p2hcwdnckmg0hia7rnx52fni04bwqkzyrghc4k"))

(define rust-chacha20-0.10.1
  (crate-source "chacha20" "0.10.1"
                "108aajbvs3rwl4d0pdvq3p8ydy4pwh0rxy2z265ynwkflrmla96m"))

(define rust-chrono-0.4.42
  (crate-source "chrono" "0.4.42"
                "1lp8iz9js9jwxw0sj8yi59v54lgvwdvm49b9wch77f25sfym4l0l"))

(define rust-chrono-0.4.43
  (crate-source "chrono" "0.4.43"
                "06312amlyys4kkjazl13mbxw0j2f7zxygzjkr1yk7s2sn57p9i7s"))

(define rust-cipher-0.4.4
  (crate-source "cipher" "0.4.4"
                "1b9x9agg67xq5nq879z66ni4l08m6m3hqcshk37d4is4ysd3ngvp"))

(define rust-clang-sys-1.8.1
  ;; TODO: Check bundled sources.
  (crate-source "clang-sys" "1.8.1"
                "1x1r9yqss76z8xwpdanw313ss6fniwc1r7dzb5ycjn0ph53kj0hb"))

(define rust-clap-4.5.48
  (crate-source "clap" "4.5.48"
                "1bjz3d7bavy13ph2a6rm3c9y02ak70b195xakii7h6q2xarln4z2"))

(define rust-clap-4.5.53
  (crate-source "clap" "4.5.53"
                "1y035lyy5w2xx83q4c3jiy75928ldm1x2bi8ylslkgx12bh41qy9"))

(define rust-clap-4.5.54
  (crate-source "clap" "4.5.54"
                "15737jmai272j6jh4ha4dq4ap14ysx2sa5wsjv6zbkvrrnfzzrn6"))

(define rust-clap-4.5.57
  (crate-source "clap" "4.5.57"
                "06p3x91f3yq4lz80lc0z56mmz314sbizdsymcmd31f9zkr4ym6b8"))

(define rust-clap-builder-4.5.48
  (crate-source "clap_builder" "4.5.48"
                "1jaxnr7ik25r4yxgz657vm8kz62f64qmwxhplmzxz9n0lfpn9fn2"))

(define rust-clap-builder-4.5.53
  (crate-source "clap_builder" "4.5.53"
                "004xasw24a9vvzpiymjkm4khffpyzqwskz7ps8gr1351x89mssyp"))

(define rust-clap-builder-4.5.54
  (crate-source "clap_builder" "4.5.54"
                "001cnl5ccva6z3x5nw3m72zs3bzb650anz1scs7vqhbs5d6wyhps"))

(define rust-clap-builder-4.5.57
  (crate-source "clap_builder" "4.5.57"
                "0f728m14vqrvcpp8pxmaz74c5dh1gd2bh5jd6sl64nhrh2vch4kv"))

(define rust-clap-complete-4.5.62
  (crate-source "clap_complete" "4.5.62"
                "1d03810a9dd49ivd6gkayiiz8s732wrfljnylyd7ad6f2imyykh0"))

(define rust-clap-complete-4.5.65
  (crate-source "clap_complete" "4.5.65"
                "0pdf33fgil55x8a3l5x5gln39wy9xlmpnqkrvr41i1p3np14s2s3"))

(define rust-clap-complete-fig-4.5.2
  (crate-source "clap_complete_fig" "4.5.2"
                "0sy88ybw33ba7qj02caxr9jv03wq1f8rdbrbqw81i5gkiwn1156l"))

(define rust-clap-complete-nushell-4.5.10
  (crate-source "clap_complete_nushell" "4.5.10"
                "06k4bfrp3rbm0bpqadr4kbb60y8hmcsq8kraagh6fx2bsdpwhnv8"))

(define rust-clap-derive-4.5.47
  (crate-source "clap_derive" "4.5.47"
                "174z9g13s85la2nmi8gv8ssjwz77im3rqg5isiinw6hg1fp7xzdv"))

(define rust-clap-derive-4.5.49
  (crate-source "clap_derive" "4.5.49"
                "0wbngw649138v3jwx8pm5x9sq0qsml3sh0sfzyrdxcpamy3m82ra"))

(define rust-clap-derive-4.5.55
  (crate-source "clap_derive" "4.5.55"
                "1r949xis3jmhzh387smd70vc8a3b9734ck3g5ahg59a63bd969x9"))

(define rust-clap-lex-0.7.5
  (crate-source "clap_lex" "0.7.5"
                "0xb6pjza43irrl99axbhs12pxq4sr8x7xd36p703j57f5i3n2kxr"))

(define rust-clap-lex-0.7.6
  (crate-source "clap_lex" "0.7.6"
                "13cxw9m2rqvplgazgkq2awms0rgf34myc19bz6gywfngi762imx1"))

(define rust-clap-lex-0.7.7
  (crate-source "clap_lex" "0.7.7"
                "0cibsbziyzw2ywar2yh6zllsamhwkblfly565zgi56s3q064prn3"))

(define rust-clap-mangen-0.2.31
  (crate-source "clap_mangen" "0.2.31"
                "00b3r0nym6wvgfas1crmsn3205149ynj2hhnjcwgjv88j8xad7j3"))

(define rust-clipboard-win-5.4.1
  (crate-source "clipboard-win" "5.4.1"
                "1m44gqy11rq1ww7jls86ppif98v6kv2wkwk8p17is86zsdq3gq5x"))

(define rust-cmov-0.3.1
  (crate-source "cmov" "0.3.1"
                "1avg148f883m979gicxy6yh1icqwxjl4s9drglk47mbmp9hcj78v"))

(define rust-cmov-0.5.4
  (crate-source "cmov" "0.5.4"
                "0yh22sqdvcdrfbhvnja4kaq5dyklpb4s70w5r6rplfdw4jna17hc"))

(define rust-color-quant-1.1.0
  (crate-source "color_quant" "1.1.0"
                "12q1n427h2bbmmm1mnglr57jaz2dj9apk0plcxw7nwqiai7qjyrx"))

(define rust-colorchoice-1.0.4
  (crate-source "colorchoice" "1.0.4"
                "0x8ymkz1xr77rcj1cfanhf416pc4v681gmkc9dzb3jqja7f62nxh"))

(define rust-colorgrad-0.8.0
  (crate-source "colorgrad" "0.8.0"
                "0zh8fd68baf1qal1a64z45cz3mkywzxvadvvrbixlvfvazjlvsdf"))

(define rust-combine-4.6.7
  (crate-source "combine" "4.6.7"
                "1z8rh8wp59gf8k23ar010phgs0wgf5i8cx4fg01gwcnzfn5k0nms"))

(define rust-compact-str-0.9.0
  (crate-source "compact_str" "0.9.0"
                "0ykhh2scg32lmzxak107pmby6fmnz7qbhsi9i8g9iknfl4ji7nrz"))

(define rust-concurrent-queue-2.5.0
  (crate-source "concurrent-queue" "2.5.0"
                "0wrr3mzq2ijdkxwndhf79k952cp4zkz35ray8hvsxl96xrx1k82c"))

(define rust-config-file-0.2.3
  (crate-source "config-file" "0.2.3"
                "1yys2088y6lnc959k1k78y0amjkp6a00pjybsk3x50872lnfflfz"))

(define rust-console-0.15.11
  (crate-source "console" "0.15.11"
                "1n5gmsjk6isbnw6qss043377kln20lfwlmdk3vswpwpr21dwnk05"))

(define rust-const-oid-0.9.6
  (crate-source "const-oid" "0.9.6"
                "1y0jnqaq7p2wvspnx7qj76m7hjcqpz73qzvr9l2p9n2s51vr6if2"))

(define rust-constant-time-eq-0.3.1
  (crate-source "constant_time_eq" "0.3.1"
                "19nwwczii762pwlsm7bpizgjg8hkg1kqi32b2g4rglijklsbhx3w"))

(define rust-convert-case-0.10.0
  (crate-source "convert_case" "0.10.0"
                "1fff1x78mp2c233g68my0ag0zrmjdbym8bfyahjbfy4cxza5hd33"))

(define rust-convert-case-0.8.0
  (crate-source "convert_case" "0.8.0"
                "17zqy79xlr1n7nc0n1mlnw5qpp8l2nbxrk13jixrhlavrbna1ams"))

(define rust-cookie-factory-0.3.3
  (crate-source "cookie-factory" "0.3.3"
                "18mka6fk3843qq3jw1fdfvzyv05kx7kcmirfbs2vg2kbw9qzm1cq"))

(define rust-core-foundation-0.10.1
  (crate-source "core-foundation" "0.10.1"
                "1xjns6dqf36rni2x9f47b65grxwdm20kwdg9lhmzdrrkwadcv9mj"))

(define rust-core-foundation-0.9.4
  (crate-source "core-foundation" "0.9.4"
                "13zvbbj07yk3b61b8fhwfzhy35535a583irf23vlcg59j7h9bqci"))

(define rust-core-foundation-sys-0.8.7
  ;; TODO: Check bundled sources.
  (crate-source "core-foundation-sys" "0.8.7"
                "12w8j73lazxmr1z0h98hf3z623kl8ms7g07jch7n4p8f9nwlhdkp"))

(define rust-core-maths-0.1.1
  (crate-source "core_maths" "0.1.1"
                "0c0dv11ixxpc9bsx5xasvl98mb1dlprzcm6qq6ls3nsygw0mwx3p"))

(define rust-coreaudio-rs-0.13.0
  (crate-source "coreaudio-rs" "0.13.0"
                "05xc1rimm02055q6y0jmsnq06rg2zdyngxwjwah7mlppp97jibhs"))

(define rust-cpal-0.16.0
  (crate-source "cpal" "0.16.0"
                "0gxab84lvh2v7s42i7i0abh6jljbh8fpmg7qs7i9g9n27ks0glyb"))

(define rust-cpal-0.17.1
  (crate-source "cpal" "0.17.1"
                "1jqwypg3h472rcns1l8hp8h86kp5iprwlypx2bxc57zi29rrq7sv"))

(define rust-cpufeatures-0.2.17
  (crate-source "cpufeatures" "0.2.17"
                "10023dnnaghhdl70xcds12fsx2b966sxbxjq5sxs49mvxqw5ivar"))

(define rust-cpufeatures-0.3.0
  (crate-source "cpufeatures" "0.3.0"
                "00fjhygsqmh4kbxxlb99mcsbspxcai6hjydv4c46pwb67wwl2alb"))

(define rust-crc32fast-1.5.0
  (crate-source "crc32fast" "1.5.0"
                "04d51liy8rbssra92p0qnwjw8i9rm9c4m3bwy19wjamz1k4w30cl"))

(define rust-crossbeam-deque-0.8.6
  (crate-source "crossbeam-deque" "0.8.6"
                "0l9f1saqp1gn5qy0rxvkmz4m6n7fc0b3dbm6q1r5pmgpnyvi3lcx"))

(define rust-crossbeam-deque-0.8.7
  (crate-source "crossbeam-deque" "0.8.7"
                "1sqcxia1mmz2fw8ba1v72jjrvbkvg7c6sz9l3sl07sv1gggf10ai"))

(define rust-crossbeam-epoch-0.9.18
  (crate-source "crossbeam-epoch" "0.9.18"
                "03j2np8llwf376m3fxqx859mgp9f83hj1w34153c7a9c7i5ar0jv"))

(define rust-crossbeam-epoch-0.9.20
  (crate-source "crossbeam-epoch" "0.9.20"
                "0gzg0v8in20iajikalg5i5qgpp0m26r426f0fs8nwk953w218s9d"))

(define rust-crossbeam-utils-0.8.21
  (crate-source "crossbeam-utils" "0.8.21"
                "0a3aa2bmc8q35fb67432w16wvi54sfmb69rk9h5bhd18vw0c99fh"))

(define rust-crossbeam-utils-0.8.22
  (crate-source "crossbeam-utils" "0.8.22"
                "05vwf7pmjq8c8f3fp5qqdm0z3cnk4p62wi8spf0jms5yjnh3v031"))

(define rust-crossterm-0.29.0
  (crate-source "crossterm" "0.29.0"
                "0yzqxxd90k7d2ac26xq1awsznsaq0qika2nv1ik3p0vzqvjg5ffq"))

(define rust-crossterm-winapi-0.9.1
  (crate-source "crossterm_winapi" "0.9.1"
                "0axbfb2ykbwbpf1hmxwpawwfs8wvmkcka5m561l7yp36ldi7rpdc"))

(define rust-crunchy-0.2.4
  (crate-source "crunchy" "0.2.4"
                "1mbp5navim2qr3x48lyvadqblcxc1dm0lqr0swrkkwy2qblvw3s6"))

(define rust-crypto-bigint-0.5.5
  (crate-source "crypto-bigint" "0.5.5"
                "0xmbdff3g6ii5sbxjxc31xfkv9lrmyril4arh3dzckd4gjsjzj8d"))

(define rust-crypto-common-0.1.7
  (crate-source "crypto-common" "0.1.7"
                "02nn2rhfy7kvdkdjl457q2z0mklcvj9h662xrq6dzhfialh2kj3q"))

(define rust-csscolorparser-0.8.1
  (crate-source "csscolorparser" "0.8.1"
                "1ia5w3n23sdlahw3q6azabskwy4gy0fa56rpvj96yicr9np6xvh2"))

(define rust-ctr-0.9.2
  (crate-source "ctr" "0.9.2"
                "0d88b73waamgpfjdml78icxz45d95q7vi2aqa604b0visqdfws83"))

(define rust-ctrlc-3.5.1
  (crate-source "ctrlc" "3.5.1"
                "146p40m5mj6w4nncj3wpsh0dlm0r0rjyblifp8sk1xxgqj4nlwvk"))

(define rust-curve25519-dalek-4.1.3
  (crate-source "curve25519-dalek" "4.1.3"
                "1gmjb9dsknrr8lypmhkyjd67p1arb8mbfamlwxm7vph38my8pywp"))

(define rust-curve25519-dalek-derive-0.1.1
  (crate-source "curve25519-dalek-derive" "0.1.1"
                "1cry71xxrr0mcy5my3fb502cwfxy6822k4pm19cwrilrg7hq4s7l"))

(define rust-daemonize-0.5.0
  (crate-source "daemonize" "0.5.0"
                "0vhikx85f85r46xghsb4avsv6ww8mz9lipqvsia7m21wrfmgv2xb"))

(define rust-darling-0.20.11
  (crate-source "darling" "0.20.11"
                "1vmlphlrlw4f50z16p4bc9p5qwdni1ba95qmxfrrmzs6dh8lczzw"))

(define rust-darling-0.23.0
  (crate-source "darling" "0.23.0"
                "179fj6p6ajw4dnkrik51wjhifxwy02x5zhligyymcb905zd17bi5"))

(define rust-darling-core-0.20.11
  (crate-source "darling_core" "0.20.11"
                "0bj1af6xl4ablnqbgn827m43b8fiicgv180749f5cphqdmcvj00d"))

(define rust-darling-core-0.23.0
  (crate-source "darling_core" "0.23.0"
                "1c033vrks38vpw8kwgd5w088dsr511kfz55n9db56prkgh7sarcq"))

(define rust-darling-macro-0.20.11
  (crate-source "darling_macro" "0.20.11"
                "1bbfbc2px6sj1pqqq97bgqn6c8xdnb2fmz66f7f40nrqrcybjd7w"))

(define rust-darling-macro-0.23.0
  (crate-source "darling_macro" "0.23.0"
                "13fvzji9xyp304mgq720z5l0xgm54qj68jibwscagkynggn88fdc"))

(define rust-dasp-sample-0.11.0
  (crate-source "dasp_sample" "0.11.0"
                "0zzw35akm3qs2rixbmlijk6h0l4g9ry6g74qc59zv1q8vs1f31qc"))

(define rust-data-encoding-2.10.0
  (crate-source "data-encoding" "2.10.0"
                "1shzipi8igi058fkx9wfiy6prd7d8rahz1lb7d4idw9nfvrf58fp"))

(define rust-data-encoding-2.9.0
  (crate-source "data-encoding" "2.9.0"
                "0xm46371aw613ghc12ay4vsnn49hpcmcwlijnqy8lbp2bpd308ra"))

(define rust-der-0.7.10
  (crate-source "der" "0.7.10"
                "1jyxacyxdx6mxbkfw99jz59dzvcd9k17rq01a7xvn1dr6wl87hg7"))

(define rust-deranged-0.5.5
  (crate-source "deranged" "0.5.5"
                "11z5939gv2klp1r1lgrp4w5fnlkj18jqqf0h9zxmia3vkrjwpv7c"))

(define rust-derive-arbitrary-1.4.2
  (crate-source "derive_arbitrary" "1.4.2"
                "0annkmfwfavd978vwwrxvrpykjfdnc3w6q1ln3j7kyfg5pc7nmhy"))

(define rust-derive-builder-0.20.2
  (crate-source "derive_builder" "0.20.2"
                "0is9z7v3kznziqsxa5jqji3ja6ay9wzravppzhcaczwbx84znzah"))

(define rust-derive-builder-core-0.20.2
  (crate-source "derive_builder_core" "0.20.2"
                "1s640r6q46c2iiz25sgvxw3lk6b6v5y8hwylng7kas2d09xwynrd"))

(define rust-derive-builder-macro-0.20.2
  (crate-source "derive_builder_macro" "0.20.2"
                "0g1zznpqrmvjlp2w7p0jzsjvpmw5rvdag0rfyypjhnadpzib0qxb"))

(define rust-derive-more-2.1.1
  (crate-source "derive_more" "2.1.1"
                "0d5i10l4aff744jw7v4n8g6cv15rjk5mp0f1z522pc2nj7jfjlfp"))

(define rust-derive-more-impl-2.1.1
  (crate-source "derive_more-impl" "2.1.1"
                "1jwdp836vymp35d7mfvvalplkdgk2683nv3zjlx65n1194k9g6kr"))

(define rust-difflib-0.4.0
  (crate-source "difflib" "0.4.0"
                "1s7byq4d7jgf2hcp2lcqxi2piqwl8xqlharfbi8kf90n8csy7131"))

(define rust-digest-0.10.7
  (crate-source "digest" "0.10.7"
                "14p2n6ih29x81akj097lvz7wi9b6b9hvls0lwrv7b6xwyy0s5ncy"))

(define rust-directories-6.0.0
  (crate-source "directories" "6.0.0"
                "0zgy2w088v8w865c11dmc3dih899fgrhvrfp7g83h6v6ai60kx8n"))

(define rust-dirs-6.0.0
  (crate-source "dirs" "6.0.0"
                "0knfikii29761g22pwfrb8d0nqpbgw77sni9h2224haisyaams63"))

(define rust-dirs-sys-0.5.0
  ;; TODO: Check bundled sources.
  (crate-source "dirs-sys" "0.5.0"
                "1aqzpgq6ampza6v012gm2dppx9k35cdycbj54808ksbys9k366p0"))

(define rust-discord-rich-presence-1.1.0
  (crate-source "discord-rich-presence" "1.1.0"
                "15149bzs7ws76nnfqzw4mxp9wflrrvxgi9g3gikijz5ir9lmvich"))

(define rust-dispatch2-0.3.0
  (crate-source "dispatch2" "0.3.0"
                "1v1ak9w0s8z1g13x4mj2y5im9wmck0i2vf8f8wc9l1n6lqi9z849"))

(define rust-displaydoc-0.2.5
  (crate-source "displaydoc" "0.2.5"
                "1q0alair462j21iiqwrr21iabkfnb13d6x5w95lkdg21q2xrqdlp"))

(define rust-divrem-1.0.0
  (crate-source "divrem" "1.0.0"
                "10nx8ipssl505knk1g42hb0w1r367nq2j2aysv0i4ppgiwgfbpb9"))

(define rust-dlib-0.5.2
  (crate-source "dlib" "0.5.2"
                "04m4zzybx804394dnqs1blz241xcy480bdwf3w9p4k6c3l46031k"))

(define rust-doc-comment-0.3.3
  (crate-source "doc-comment" "0.3.3"
                "043sprsf3wl926zmck1bm7gw0jq50mb76lkpk49vasfr6ax1p97y"))

(define rust-document-features-0.2.12
  (crate-source "document-features" "0.2.12"
                "0qcgpialq3zgvjmsvar9n6v10rfbv6mk6ajl46dd4pj5hn3aif6l"))

(define rust-dotenvy-0.15.7
  (crate-source "dotenvy" "0.15.7"
                "16s3n973n5aqym02692i1npb079n5mb0fwql42ikmwn8wnrrbbqs"))

(define rust-downcast-rs-1.2.1
  (crate-source "downcast-rs" "1.2.1"
                "1lmrq383d1yszp7mg5i7i56b17x2lnn3kb91jwsq0zykvg2jbcvm"))

(define rust-ecdsa-0.16.9
  (crate-source "ecdsa" "0.16.9"
                "1jhb0bcbkaz4001sdmfyv8ajrv8a1cg7z7aa5myrd4jjbhmz69zf"))

(define rust-ed25519-2.2.3
  (crate-source "ed25519" "2.2.3"
                "0lydzdf26zbn82g7xfczcac9d7mzm3qgx934ijjrd5hjpjx32m8i"))

(define rust-ed25519-dalek-2.2.0
  (crate-source "ed25519-dalek" "2.2.0"
                "1agcwij1z687hg26ngzwhnmpz29b2w56m8z1ap3pvrnfh709drvh"))

(define rust-either-1.15.0
  (crate-source "either" "1.15.0"
                "069p1fknsmzn9llaizh77kip0pqmcwpdsykv2x30xpjyija5gis8"))

(define rust-either-1.16.0
  (crate-source "either" "1.16.0"
                "17k7jfbdz7k440h6lws9baz8p9zlxgb41sig3w81h80nwzsjyqli"))

(define rust-elliptic-curve-0.13.8
  (crate-source "elliptic-curve" "0.13.8"
                "0ixx4brgnzi61z29r3g1606nh2za88hzyz8c5r3p6ydzhqq09rmm"))

(define rust-encode-unicode-1.0.0
  (crate-source "encode_unicode" "1.0.0"
                "1h5j7j7byi289by63s3w4a8b3g6l5ccdrws7a67nn07vdxj77ail"))

(define rust-encoding-rs-0.8.35
  (crate-source "encoding_rs" "0.8.35"
                "1wv64xdrr9v37rqqdjsyb8l8wzlcbab80ryxhrszvnj59wy0y0vm"))

(define rust-endi-1.1.1
  (crate-source "endi" "1.1.1"
                "16a0076dx41vgrzzimm9clcym77h732czqjiajanmzvd1i1y5dv6"))

(define rust-enum-dispatch-0.3.13
  (crate-source "enum_dispatch" "0.3.13"
                "1kby2jz173ggg7wk41vjsskmkdyx7749ll8lhqhv6mb5qqmww65a"))

(define rust-enumflags2-0.7.12
  (crate-source "enumflags2" "0.7.12"
                "1vzcskg4dca2jiflsfx1p9yw1fvgzcakcs7cpip0agl51ilgf9qh"))

(define rust-enumflags2-derive-0.7.12
  (crate-source "enumflags2_derive" "0.7.12"
                "09rqffacafl1b83ir55hrah9gza0x7pzjn6lr6jm76fzix6qmiv7"))

(define rust-env-filter-0.1.3
  (crate-source "env_filter" "0.1.3"
                "1l4p6f845cylripc3zkxa0lklk8rn2q86fqm522p6l2cknjhavhq"))

(define rust-env-filter-0.1.4
  (crate-source "env_filter" "0.1.4"
                "1qk8yn4lsqzxsz025kf4kaabika6aidykqih3c2p1jjms9cw5wqv"))

(define rust-env-logger-0.11.8
  (crate-source "env_logger" "0.11.8"
                "17q6zbjam4wq75fa3m4gvvmv3rj3ch25abwbm84b28a0j3q67j0k"))

(define rust-epoxy-0.1.0
  (crate-source "epoxy" "0.1.0"
                "17jd46cw3dknaq1iz2w3z700zs2q30l470px28irf0zzwf6055lv"))

(define rust-equator-0.4.2
  (crate-source "equator" "0.4.2"
                "1z760z5r0haxjyakbqxvswrz9mq7c29arrivgq8y1zldhc9v44a7"))

(define rust-equator-macro-0.4.2
  (crate-source "equator-macro" "0.4.2"
                "1cqzx3cqn9rxln3a607xr54wippzff56zs5chqdf3z2bnks3rwj4"))

(define rust-equivalent-1.0.2
  (crate-source "equivalent" "1.0.2"
                "03swzqznragy8n0x31lqc78g2af054jwivp7lkrbrc0khz74lyl7"))

(define rust-errno-0.3.14
  (crate-source "errno" "0.3.14"
                "1szgccmh8vgryqyadg8xd58mnwwicf39zmin3bsn63df2wbbgjir"))

(define rust-error-code-3.3.2
  (crate-source "error-code" "3.3.2"
                "0nacxm9xr3s1rwd6fabk3qm89fyglahmbi4m512y0hr8ym6dz8ny"))

(define rust-event-listener-5.4.1
  (crate-source "event-listener" "5.4.1"
                "1asnp3agbr8shcl001yd935m167ammyi8hnvl0q1ycajryn6cfz1"))

(define rust-event-listener-strategy-0.5.4
  (crate-source "event-listener-strategy" "0.5.4"
                "14rv18av8s7n8yixg38bxp5vg2qs394rl1w052by5npzmbgz7scb"))

(define rust-exr-1.73.0
  (crate-source "exr" "1.73.0"
                "1q47yq78q9k210r6jy1wwrilxwwxqavik9l3l426rd17k7srfcgq"))

(define rust-exr-1.74.2
  (crate-source "exr" "1.74.2"
                "1wxd45pcgcc1zs7dcl39i2c4plp1w2gkzfizxq0mwab4k4nf87vi"))

(define rust-fancy-regex-0.16.2
  (crate-source "fancy-regex" "0.16.2"
                "0vy4c012f82xcg3gs068mq110zhsrnajh58fmq1jxr7vaijhb2wr"))

(define rust-fast-srgb8-1.0.0
  (crate-source "fast-srgb8" "1.0.0"
                "18g6xwwh4gnkyx1352hnvwagpv0n4y98yp2llm8vyvwxh487abnx"))

(define rust-fastrand-2.3.0
  (crate-source "fastrand" "2.3.0"
                "1ghiahsw1jd68df895cy5h3gzwk30hndidn3b682zmshpgmrx41p"))

(define rust-fax-0.2.6
  (crate-source "fax" "0.2.6"
                "1ax0jmvsszxd03hj6ga1kyl7gaqcfw0akg2wf0q6gk9pizaffpgh"))

(define rust-fax-0.2.7
  (crate-source "fax" "0.2.7"
                "0nmc65jjdym0f7lr4qm2q7awz1p5arm8i19wv1cmsg92cfahgwfa"))

(define rust-fax-derive-0.2.0
  (crate-source "fax_derive" "0.2.0"
                "0zap434zz4xvi5rnysmwzzivig593b4ng15vwzwl7js2nw7s3b50"))

(define rust-fdeflate-0.3.7
  (crate-source "fdeflate" "0.3.7"
                "130ga18vyxbb5idbgi07njymdaavvk6j08yh1dfarm294ssm6s0y"))

(define rust-femtovg-0.20.1
  (crate-source "femtovg" "0.20.1"
                "0dil16zzza2b69ps3fznbbhggkd3kdci4ihwfcz4gcp29mfjj9d1"))

(define rust-ff-0.13.1
  (crate-source "ff" "0.13.1"
                "14v3bc6q24gbcjnxjfbq2dddgf4as2z2gd4mj35gjlrncpxhpdf0"))

(define rust-fiat-crypto-0.2.9
  (crate-source "fiat-crypto" "0.2.9"
                "07c1vknddv3ak7w89n85ik0g34nzzpms6yb845vrjnv9m4csbpi8"))

(define rust-field-offset-0.3.6
  (crate-source "field-offset" "0.3.6"
                "0zq5sssaa2ckmcmxxbly8qgz3sxpb8g1lwv90sdh1z74qif2gqiq"))

(define rust-filesize-0.2.0
  (crate-source "filesize" "0.2.0"
                "0hvx4dfnara3a2dnhb9ci5bmm1m8s44h9l61s5djwkjx87i43mqj"))

(define rust-filetime-0.2.27
  (crate-source "filetime" "0.2.27"
                "1nspbkm1d1km7xfljcbl565swqxrihqyin8bqppig2gf3qal927r"))

(define rust-find-msvc-tools-0.1.2
  (crate-source "find-msvc-tools" "0.1.2"
                "0nbrhvk4m04hviiwbqp2jwcv9j2k70x0q2kcvfk51iygvaqp7v8w"))

(define rust-find-msvc-tools-0.1.5
  (crate-source "find-msvc-tools" "0.1.5"
                "0i1ql02y37bc7xywkqz10kx002vpz864vc4qq88h1jam190pcc1s"))

(define rust-find-msvc-tools-0.1.6
  (crate-source "find-msvc-tools" "0.1.6"
                "1zwdxinsg7i0agvapxa5cj7k09vygzjy8nkxc4qpa2z6hhxbnp34"))

(define rust-find-msvc-tools-0.1.8
  (crate-source "find-msvc-tools" "0.1.8"
                "1nv8hn78xphg04l6w7iq1v8lsmmqx6ripbig18qn92m9r2yb14c5"))

(define rust-find-msvc-tools-0.1.9
  (crate-source "find-msvc-tools" "0.1.9"
                "10nmi0qdskq6l7zwxw5g56xny7hb624iki1c39d907qmfh3vrbjv"))

(define rust-fixed-1.29.0
  (crate-source "fixed" "1.29.0"
                "1hwmzqyik81ckv6j1vbi3f86dhi9dqca14q84543a5y4z3670w3h"))

(define rust-fixedbitset-0.4.2
  (crate-source "fixedbitset" "0.4.2"
                "101v41amgv5n9h4hcghvrbfk5vrncx1jwm35rn5szv4rk55i7rqc"))

(define rust-flate2-1.1.2
  (crate-source "flate2" "1.1.2"
                "07abz7v50lkdr5fjw8zaw2v8gm2vbppc0f7nqm8x3v3gb6wpsgaa"))

(define rust-flate2-1.1.8
  (crate-source "flate2" "1.1.8"
                "0sgkq8z9ldz06qxl704sm9akfy2r70zp1ixi4mghl2cqbd3dcxdk"))

(define rust-flate2-1.1.9
  (crate-source "flate2" "1.1.9"
                "0g2pb7cxnzcbzrj8bw4v6gpqqp21aycmf6d84rzb6j748qkvlgw4"))

(define rust-flume-0.12.0
  (crate-source "flume" "0.12.0"
                "1gnk7gji9r12ig35czj2cq441zf5ijmz0bgnz9gfnxx7dk29n4sy"))

(define rust-fnv-1.0.7
  (crate-source "fnv" "1.0.7"
                "1hc2mcqha06aibcaza94vbi81j6pr9a1bbxrxjfhc91zin8yr7iz"))

(define rust-foldhash-0.1.5
  (crate-source "foldhash" "0.1.5"
                "1wisr1xlc2bj7hk4rgkcjkz3j2x4dhd1h9lwk7mj8p71qpdgbi6r"))

(define rust-foldhash-0.2.0
  (crate-source "foldhash" "0.2.0"
                "1nvgylb099s11xpfm1kn2wcsql080nqmnhj1l25bp3r2b35j9kkp"))

(define rust-fontconfig-0.10.0
  (crate-source "fontconfig" "0.10.0"
                "17s2a8gbykgy0cgn6nr0wcg4sd4rwslh6d1yzcxs4pkhik54p75i"))

(define rust-foreign-types-0.3.2
  (crate-source "foreign-types" "0.3.2"
                "1cgk0vyd7r45cj769jym4a6s7vwshvd0z4bqrb92q1fwibmkkwzn"))

(define rust-foreign-types-shared-0.1.1
  (crate-source "foreign-types-shared" "0.1.1"
                "0jxgzd04ra4imjv8jgkmdq59kj8fsz6w4zxsbmlai34h26225c00"))

(define rust-form-urlencoded-1.2.2
  (crate-source "form_urlencoded" "1.2.2"
                "1kqzb2qn608rxl3dws04zahcklpplkd5r1vpabwga5l50d2v4k6b"))

(define rust-fragile-2.0.1
  (crate-source "fragile" "2.0.1"
                "06g69s9w3hmdnjp5b60ph15v367278mgxy1shijrllarc2pnrp98"))

(define rust-funty-2.0.0
  (crate-source "funty" "2.0.0"
                "177w048bm0046qlzvp33ag3ghqkqw4ncpzcm5lq36gxf2lla7mg6"))

(define rust-futures-0.3.31
  (crate-source "futures" "0.3.31"
                "0xh8ddbkm9jy8kc5gbvjp9a4b6rqqxvc8471yb2qaz5wm2qhgg35"))

(define rust-futures-channel-0.3.31
  (crate-source "futures-channel" "0.3.31"
                "040vpqpqlbk099razq8lyn74m0f161zd0rp36hciqrwcg2zibzrd"))

(define rust-futures-core-0.3.31
  (crate-source "futures-core" "0.3.31"
                "0gk6yrxgi5ihfanm2y431jadrll00n5ifhnpx090c2f2q1cr1wh5"))

(define rust-futures-executor-0.3.31
  (crate-source "futures-executor" "0.3.31"
                "17vcci6mdfzx4gbk0wx64chr2f13wwwpvyf3xd5fb1gmjzcx2a0y"))

(define rust-futures-io-0.3.31
  (crate-source "futures-io" "0.3.31"
                "1ikmw1yfbgvsychmsihdkwa8a1knank2d9a8dk01mbjar9w1np4y"))

(define rust-futures-lite-2.6.1
  (crate-source "futures-lite" "2.6.1"
                "1ba4dg26sc168vf60b1a23dv1d8rcf3v3ykz2psb7q70kxh113pp"))

(define rust-futures-macro-0.3.31
  (crate-source "futures-macro" "0.3.31"
                "0l1n7kqzwwmgiznn0ywdc5i24z72zvh9q1dwps54mimppi7f6bhn"))

(define rust-futures-sink-0.3.31
  (crate-source "futures-sink" "0.3.31"
                "1xyly6naq6aqm52d5rh236snm08kw8zadydwqz8bip70s6vzlxg5"))

(define rust-futures-task-0.3.31
  (crate-source "futures-task" "0.3.31"
                "124rv4n90f5xwfsm9qw6y99755y021cmi5dhzh253s920z77s3zr"))

(define rust-futures-timer-3.0.3
  (crate-source "futures-timer" "3.0.3"
                "094vw8k37djpbwv74bwf2qb7n6v6ghif4myss6smd6hgyajb127j"))

(define rust-futures-util-0.3.31
  (crate-source "futures-util" "0.3.31"
                "10aa1ar8bgkgbr4wzxlidkqkcxf77gffyj8j7768h831pcaq784z"))

(define rust-gdk-pixbuf-0.21.5
  (crate-source "gdk-pixbuf" "0.21.5"
                "0350zm38d7sf3ilnwy9fxyhajbdslvjdcm7xxlk4dn6dwcwhvfyy"))

(define rust-gdk-pixbuf-sys-0.21.5
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "gdk-pixbuf-sys" "0.21.5"
                "1rqc1bv3ln6hx4a4bn3jagz75dzhmy96hkyx4lg5blm3p58av5dx"))

(define rust-gdk4-0.10.3
  (crate-source "gdk4" "0.10.3"
                "1gxzhk55r0nh48ld7l1j700cc6jqh8jvvzw8bph4qjmy5chn8rbm"))

(define rust-gdk4-sys-0.10.3
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "gdk4-sys" "0.10.3"
                "0d5hk2agfifnn0hgcjyb4lcrvrdlaxgkzj6w99m854gmrjrybm56"))

(define rust-generator-0.8.5
  (crate-source "generator" "0.8.5"
                "09v88ic14jypd6sl1g3bqcp2a07r2h4lgxzidisgzy5pdjkp116i"))

(define rust-generator-0.8.9
  (crate-source "generator" "0.8.9"
                "1bhk2m8alf9nfmmq2y2whyriigppgjnzrchq7yix3sl4wnq59f5k"))

(define rust-generic-array-0.14.7
  (crate-source "generic-array" "0.14.7"
                "16lyyrzrljfq424c3n8kfwkqihlimmsg5nhshbbp48np3yjrqr45"))

(define rust-gethostname-1.1.0
  (crate-source "gethostname" "1.1.0"
                "1n6bj9gh503ggjblfjcai96gmxynxsrykaynljlrfdra34q95m0v"))

(define rust-getrandom-0.2.16
  (crate-source "getrandom" "0.2.16"
                "14l5aaia20cc6cc08xdlhrzmfcylmrnprwnna20lqf746pqzjprk"))

(define rust-getrandom-0.2.17
  (crate-source "getrandom" "0.2.17"
                "1l2ac6jfj9xhpjjgmcx6s1x89bbnw9x6j9258yy6xjkzpq0bqapz"))

(define rust-getrandom-0.3.3
  (crate-source "getrandom" "0.3.3"
                "1x6jl875zp6b2b6qp9ghc84b0l76bvng2lvm8zfcmwjl7rb5w516"))

(define rust-getrandom-0.3.4
  (crate-source "getrandom" "0.3.4"
                "1zbpvpicry9lrbjmkd4msgj3ihff1q92i334chk7pzf46xffz7c9"))

(define rust-getrandom-0.4.3
  (crate-source "getrandom" "0.4.3"
                "16b0202fkdwz3p2cyll82dv24ljbn0wiyy829v4lwbkbflyqh3ih"))

(define rust-gif-0.13.3
  (crate-source "gif" "0.13.3"
                "06z6gll24q7psbz9fb86jbcbmgwnxkym8jsp0fbq5qikbqilgq2a"))

(define rust-gif-0.14.2
  (crate-source "gif" "0.14.2"
                "0n81js7vlb9bwrjb765sicza3k0vrihjddrgm2mvpbfr272gr37f"))

(define rust-gimli-0.31.1
  (crate-source "gimli" "0.31.1"
                "0gvqc0ramx8szv76jhfd4dms0zyamvlg4whhiz11j34hh3dqxqh7"))

(define rust-gimli-0.32.3
  (crate-source "gimli" "0.32.3"
                "1iqk5xznimn5bfa8jy4h7pa1dv3c624hzgd2dkz8mpgkiswvjag6"))

(define rust-gio-0.21.5
  (crate-source "gio" "0.21.5"
                "06l1nlq5r0dvm0xmhrpgvs8ypx7jcb3vgihxwrvb8s0cc2zlizy5"))

(define rust-gio-sys-0.21.5
  ;; TODO: Check bundled sources.
  (crate-source "gio-sys" "0.21.5"
                "08hgv0lqm94hyhdisjrl52bg9699c9ibp6zzr2301r58vf4gww80"))

(define rust-gl-generator-0.9.0
  (crate-source "gl_generator" "0.9.0"
                "02lx6zfvpszp43161645hvj06smfbi9dgmjqm9xmlnyqrdq52ybs"))

(define rust-glib-0.21.5
  (crate-source "glib" "0.21.5"
                "12xxy5js4bfpjz9k6831xj090r5y37g30wrvawxwx43c5qy15phn"))

(define rust-glib-macros-0.21.5
  (crate-source "glib-macros" "0.21.5"
                "05vzv1m4dg1cpkakxk3n1846acv4fhwhghq1zsbaca0j61svcnfg"))

(define rust-glib-sys-0.21.5
  ;; TODO: Check bundled sources.
  (crate-source "glib-sys" "0.21.5"
                "0v1ymxb51sbwv242slq21kbn8g38j2day53f52kn9r4sl6iy359d"))

(define rust-glob-0.3.3
  (crate-source "glob" "0.3.3"
                "106jpd3syfzjfj2k70mwm0v436qbx96wig98m4q8x071yrq35hhc"))

(define rust-glow-0.16.0
  (crate-source "glow" "0.16.0"
                "022z12nlyfpy36fvp2szq792xix1xbgkznpmicf1c404sxhfmrf5"))

(define rust-gobject-sys-0.21.5
  ;; TODO: Check bundled sources.
  (crate-source "gobject-sys" "0.21.5"
                "157jv8ga4f7p4vrn4mmg84lrl0ly3kz9kjzkfm2qz88r1pd3bjid"))

(define rust-governor-0.10.4
  (crate-source "governor" "0.10.4"
                "1f132b6a625j4gskmdlvhhyn1xv82sz42ajsybqhyn2q34yapz4y"))

(define rust-graphene-rs-0.21.5
  (crate-source "graphene-rs" "0.21.5"
                "1yg23ws354622ya5qccwvf9gpjn188vhkrz1pzc3yrnvr4506c17"))

(define rust-graphene-sys-0.21.5
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "graphene-sys" "0.21.5"
                "14zxhk20yypksyh8kx14xf5ddhjifcmzcjh49cg29bd93q4k4pli"))

(define rust-group-0.13.0
  (crate-source "group" "0.13.0"
                "0qqs2p5vqnv3zvq9mfjkmw3qlvgqb0c3cm6p33srkh7pc9sfzygh"))

(define rust-gsk4-0.10.3
  (crate-source "gsk4" "0.10.3"
                "0lx17acgawg9xn216lgikcdpy1lxjvhqk2q2mazcb5jqijfxwmg7"))

(define rust-gsk4-sys-0.10.3
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "gsk4-sys" "0.10.3"
                "1xzlf8yidajc86cm7fcmn5br11lgdn3l242z0s1g8ihi75r19sbw"))

(define rust-gstreamer-0.24.4
  (crate-source "gstreamer" "0.24.4"
                "1mx9wfazj7izhbkhna5spcg6xyc9gnv0irivad4cnm2x5is77v8b"))

(define rust-gstreamer-app-0.24.4
  (crate-source "gstreamer-app" "0.24.4"
                "1z7v96lhgn453p0pg0jv39ghkybffj7xdfg647rr6rlp1zxm6mw9"))

(define rust-gstreamer-app-sys-0.24.4
  ;; TODO: Check bundled sources.
  (crate-source "gstreamer-app-sys" "0.24.4"
                "1069zi84b2lsrqxr5qav7hynbl4bc9lkgs8ymd41mnmg53p9qwgp"))

(define rust-gstreamer-audio-0.24.4
  (crate-source "gstreamer-audio" "0.24.4"
                "0qx73xkxj0dqb2q23n6sz5mms67k1j6dsm4i1jzx97n5lyy9v0lj"))

(define rust-gstreamer-audio-sys-0.24.4
  ;; TODO: Check bundled sources.
  (crate-source "gstreamer-audio-sys" "0.24.4"
                "0x8lf40i6f7pwm5x3phy7hkn6787555gg5rmk12jq4kqgf281kba"))

(define rust-gstreamer-base-0.24.4
  (crate-source "gstreamer-base" "0.24.4"
                "1244552xm3ls1bs61c0py9ji4wgfv2ymqjl3cqvmf1nk6xz5rlad"))

(define rust-gstreamer-base-sys-0.24.4
  ;; TODO: Check bundled sources.
  (crate-source "gstreamer-base-sys" "0.24.4"
                "1rlydin01dk4myvzx2zx0hyvb9kys28b46dzhccc24qyqsifv8i7"))

(define rust-gstreamer-sys-0.24.4
  ;; TODO: Check bundled sources.
  (crate-source "gstreamer-sys" "0.24.4"
                "0129bphfxi61h6227lrdaf909a4vj49ppv5wwwcw6mz7jw36722x"))

(define rust-gtk4-0.10.3
  (crate-source "gtk4" "0.10.3"
                "1971514d9kadzj61rn28fgc4gjk77g2335sl8fpvzxy6rx9ivcmc"))

(define rust-gtk4-macros-0.10.3
  (crate-source "gtk4-macros" "0.10.3"
                "0hiy02q0gnfqg1bj8iycb5xmgm0jz80q2psxh521551x9ahvbkrw"))

(define rust-gtk4-sys-0.10.3
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "gtk4-sys" "0.10.3"
                "1pc803r3921h44pa773qpirn3aqcrq2fibykdhb5vq8ybbz7f9c4"))

(define rust-gvdb-0.9.0
  (crate-source "gvdb" "0.9.0"
                "0hqbnc88vnzkbgz42vaisihbv4jr3iwhbqb3rwsvqjzrcf54rndr"))

(define rust-h2-0.4.13
  (crate-source "h2" "0.4.13"
                "0m6w5gg0n0m1m5915bxrv8n4rlazhx5icknkslz719jhh4xdli1g"))

(define rust-half-2.6.0
  (crate-source "half" "2.6.0"
                "1j83v0xaqvrw50ppn0g33zig0zsbdi7xiqbzgn7sd5al57nrd4a5"))

(define rust-half-2.7.1
  (crate-source "half" "2.7.1"
                "0jyq42xfa6sghc397mx84av7fayd4xfxr4jahsqv90lmjr5xi8kf"))

(define rust-hashbrown-0.15.4
  (crate-source "hashbrown" "0.15.4"
                "1mg045sm1nm00cwjm7ndi80hcmmv1v3z7gnapxyhd9qxc62sqwar"))

(define rust-hashbrown-0.15.5
  (crate-source "hashbrown" "0.15.5"
                "189qaczmjxnikm9db748xyhiw04kpmhm9xj9k9hg0sgx7pjwyacj"))

(define rust-hashbrown-0.16.1
  (crate-source "hashbrown" "0.16.1"
                "004i3njw38ji3bzdp9z178ba9x3k0c1pgy8x69pj7yfppv4iq7c4"))

(define rust-hashbrown-0.17.1
  (crate-source "hashbrown" "0.17.1"
                "0jmqz7i4yl6cm7rbn0i2ffkfrmwi6xkmzkaldr2v8bcsx2v0jngd"))

(define rust-headers-0.4.1
  (crate-source "headers" "0.4.1"
                "1sr4zygaq1b2f0k7b5l8vx5vp05wvd82w7vpavgvr52xvdd4scdk"))

(define rust-headers-core-0.3.0
  (crate-source "headers-core" "0.3.0"
                "1r1w80i2bhmyh8s5mjr2dz6baqlrm6cak6yvzm4jq96lacjs5d2l"))

(define rust-heck-0.5.0
  (crate-source "heck" "0.5.0"
                "1sjmpsdl8czyh9ywl3qcsfsq9a307dg4ni2vnlwgnzzqhc4y0113"))

(define rust-hermit-abi-0.5.2
  (crate-source "hermit-abi" "0.5.2"
                "1744vaqkczpwncfy960j2hxrbjl1q01csm84jpd9dajbdr2yy3zw"))

(define rust-hex-0.4.3
  (crate-source "hex" "0.4.3"
                "0w1a4davm1lgzpamwnba907aysmlrnygbqmfis2mqjx5m552a93z"))

(define rust-hex-color-3.0.0
  (crate-source "hex_color" "3.0.0"
                "1w2f91y34b30x8jy6y4f37fh6i9ia1h16pjb5v5gfcy6yhdi0zyk"))

(define rust-hkdf-0.12.4
  (crate-source "hkdf" "0.12.4"
                "1xxxzcarz151p1b858yn5skmhyrvn8fs4ivx5km3i1kjmnr8wpvv"))

(define rust-hmac-0.12.1
  (crate-source "hmac" "0.12.1"
                "0pmbr069sfg76z7wsssfk5ddcqd9ncp79fyz6zcm6yn115yc6jbc"))

(define rust-home-0.5.12
  (crate-source "home" "0.5.12"
                "13bjyzgx6q9srnfvl43dvmhn93qc8mh5w7cylk2g13sj3i3pyqnc"))

(define rust-http-1.4.0
  (crate-source "http" "1.4.0"
                "06iind4cwsj1d6q8c2xgq8i2wka4ps74kmws24gsi1bzdlw2mfp3"))

(define rust-http-body-1.0.1
  (crate-source "http-body" "1.0.1"
                "111ir5k2b9ihz5nr9cz7cwm7fnydca7dx4hc7vr16scfzghxrzhy"))

(define rust-http-body-util-0.1.3
  (crate-source "http-body-util" "0.1.3"
                "0jm6jv4gxsnlsi1kzdyffjrj8cfr3zninnxpw73mvkxy4qzdj8dh"))

(define rust-httparse-1.10.1
  (crate-source "httparse" "1.10.1"
                "11ycd554bw2dkgw0q61xsa7a4jn1wb1xbfacmf3dbwsikvkkvgvd"))

(define rust-httpdate-1.0.3
  (crate-source "httpdate" "1.0.3"
                "1aa9rd2sac0zhjqh24c9xvir96g188zldkx0hr6dnnlx5904cfyz"))

(define rust-humantime-2.3.0
  (crate-source "humantime" "2.3.0"
                "092lpipp32ayz4kyyn4k3vz59j9blng36wprm5by0g2ykqr14nqk"))

(define rust-hyper-1.8.1
  (crate-source "hyper" "1.8.1"
                "04cxr8j5y86bhxxlyqb8xkxjskpajk7cxwfzzk4v3my3a3rd9cia"))

(define rust-hyper-proxy2-0.1.0
  (crate-source "hyper-proxy2" "0.1.0"
                "1brzvj6v5rfzq17x6wbg41vcqhpwli87phhlf0f4mg5h7yrbfhwh"))

(define rust-hyper-rustls-0.27.7
  (crate-source "hyper-rustls" "0.27.7"
                "0n6g8998szbzhnvcs1b7ibn745grxiqmlpg53xz206v826v3xjg3"))

(define rust-hyper-tls-0.6.0
  (crate-source "hyper-tls" "0.6.0"
                "1q36x2yps6hhvxq5r7mc8ph9zz6xlb573gx0x3yskb0fi736y83h"))

(define rust-hyper-util-0.1.19
  (crate-source "hyper-util" "0.1.19"
                "0pyzc8378baf996l5ycl4y0s3skhxc4z4vkah9mvff3r1vb0ay3j"))

(define rust-iana-time-zone-0.1.64
  (crate-source "iana-time-zone" "0.1.64"
                "1yz980fmhaq9bdkasz35z63az37ci6kzzfhya83kgdqba61pzr9k"))

(define rust-iana-time-zone-0.1.65
  (crate-source "iana-time-zone" "0.1.65"
                "0w64khw5p8s4nzwcf36bwnsmqzf61vpwk9ca1920x82bk6nwj6z3"))

(define rust-iana-time-zone-haiku-0.1.2
  (crate-source "iana-time-zone-haiku" "0.1.2"
                "17r6jmj31chn7xs9698r122mapq85mfnv98bb4pg6spm0si2f67k"))

(define rust-icu-collections-2.1.1
  (crate-source "icu_collections" "2.1.1"
                "0hsblchsdl64q21qwrs4hvc2672jrf466zivbj1bwyv606bn8ssc"))

(define rust-icu-locale-core-2.1.1
  (crate-source "icu_locale_core" "2.1.1"
                "1djvdc2f5ylmp1ymzv4gcnmq1s4hqfim9nxlcm173lsd01hpifpd"))

(define rust-icu-normalizer-2.1.1
  (crate-source "icu_normalizer" "2.1.1"
                "16dmn5596la2qm0r3vih0bzjfi0vx9a20yqjha6r1y3vnql8hv2z"))

(define rust-icu-normalizer-data-2.1.1
  (crate-source "icu_normalizer_data" "2.1.1"
                "02jnzizg6q75m41l6c13xc7nkc5q8yr1b728dcgfhpzw076wrvbs"))

(define rust-icu-properties-2.1.2
  (crate-source "icu_properties" "2.1.2"
                "1v3lbmhhi7i6jgw51ikjb1p50qh5rb67grlkdnkc63l7zq1gq2q2"))

(define rust-icu-properties-data-2.1.2
  (crate-source "icu_properties_data" "2.1.2"
                "1bvpkh939rgzrjfdb7hz47v4wijngk0snmcgrnpwc9fpz162jv31"))

(define rust-icu-provider-2.1.1
  (crate-source "icu_provider" "2.1.1"
                "0576b7dizgyhpfa74kacv86y4g1p7v5ffd6c56kf1q82rvq2r5l5"))

(define rust-ident-case-1.0.1
  (crate-source "ident_case" "1.0.1"
                "0fac21q6pwns8gh1hz3nbq15j8fi441ncl6w4vlnd1cmc55kiq5r"))

(define rust-idna-1.1.0
  (crate-source "idna" "1.1.0"
                "1pp4n7hppm480zcx411dsv9wfibai00wbpgnjj4qj0xa7kr7a21v"))

(define rust-idna-adapter-1.2.1
  (crate-source "idna_adapter" "1.2.1"
                "0i0339pxig6mv786nkqcxnwqa87v4m94b2653f6k3aj0jmhfkjis"))

(define rust-image-0.25.10
  (crate-source "image" "0.25.10"
                "0131b9fsd5grxf3lchfs2ci0rg8ga2mh1ygai7k2zh1k8cwq1aw5"))

(define rust-image-0.25.6
  (crate-source "image" "0.25.6"
                "06i522bq4qlwylwnlmcn0sgqg72swwan544aldbhi0drwr66cdfv"))

(define rust-image-0.25.9
  (crate-source "image" "0.25.9"
                "06lwa4ag3zcmjzivl356q0qhgxxqpkp7qwda7x0mjrkq21n6ql76"))

(define rust-image-webp-0.2.3
  (crate-source "image-webp" "0.2.3"
                "02vg5rfmkvslypd0xij6ynzaah3m32hfylicwr14n2rhlpkhz5zn"))

(define rust-image-webp-0.2.4
  (crate-source "image-webp" "0.2.4"
                "1hz814csyi9283vinzlkix6qpnd6hs3fkw7xl6z2zgm4w7rrypjj"))

(define rust-imara-diff-0.2.0
  (crate-source "imara-diff" "0.2.0"
                "0p2wmak4pbqfa93fihply18kq8q0nxg6zl0dhampipv6yxid809g"))

(define rust-imgref-1.11.0
  (crate-source "imgref" "1.11.0"
                "0254wzkakm31fdix6diqng0fkggknibh0b1iv570ap0djwykl9nh"))

(define rust-imgref-1.12.0
  (crate-source "imgref" "1.12.0"
                "1j3iwdal9mdkmyrsms3lz4n1bxxxjxss2jvbmh662fns63fcxig7"))

(define rust-imgref-1.12.2
  (crate-source "imgref" "1.12.2"
                "1msc8g8x8a9dy3l85ila4sijvnhr1rxrxsbjhqk1bawkm64lc6c9"))

(define rust-indexmap-2.10.0
  (crate-source "indexmap" "2.10.0"
                "0qd6g26gxzl6dbf132w48fa8rr95glly3jhbk90i29726d9xhk7y"))

(define rust-indexmap-2.12.1
  (crate-source "indexmap" "2.12.1"
                "1wmcfk7g7d9wz1dninlijx70kfkzz6d5r36nyi2hdjjvaqmvpm0a"))

(define rust-indexmap-2.13.0
  (crate-source "indexmap" "2.13.0"
                "05qh5c4h2hrnyypphxpwflk45syqbzvqsvvyxg43mp576w2ff53p"))

(define rust-indexmap-2.14.0
  (crate-source "indexmap" "2.14.0"
                "1na9z6f0d5pkjr1lgsni470v98gv2r7c41j8w48skr089x2yjrnl"))

(define rust-indicatif-0.17.11
  (crate-source "indicatif" "0.17.11"
                "0db2b2r79r9x8x4lysq1ci9xm13c0xg0sqn3z960yh2bk2430fqq"))

(define rust-indoc-2.0.7
  (crate-source "indoc" "2.0.7"
                "01np60qdq6lvgh8ww2caajn9j4dibx9n58rvzf7cya1jz69mrkvr"))

(define rust-inout-0.1.4
  (crate-source "inout" "0.1.4"
                "008xfl1jn9rxsq19phnhbimccf4p64880jmnpg59wqi07kk117w7"))

(define rust-instability-0.3.11
  (crate-source "instability" "0.3.11"
                "07f1apjp00nzkwmzfzlfm6p4klddf0g2scgdhqnds66dqq2p4yrm"))

(define rust-interpolate-name-0.2.4
  (crate-source "interpolate_name" "0.2.4"
                "0q7s5mrfkx4p56dl8q9zq71y1ysdj4shh6f28qf9gly35l21jj63"))

(define rust-io-uring-0.7.10
  (crate-source "io-uring" "0.7.10"
                "0yvjyygwdcqjcgw8zp254hvjbm7as1c075dl50spdshas3aa4vq4"))

(define rust-ipnet-2.11.0
  (crate-source "ipnet" "2.11.0"
                "0c5i9sfi2asai28m8xp48k5gvwkqrg5ffpi767py6mzsrswv17s6"))

(define rust-iri-string-0.7.10
  (crate-source "iri-string" "0.7.10"
                "06kk3a5jz576p7vrpf7zz9jv3lrgcyp7pczcblcxdnryg3q3h4y9"))

(define rust-iri-string-0.7.9
  (crate-source "iri-string" "0.7.9"
                "15s3s6k99ci52d7qdplhllpa6xyvdyiys645n6z6fsw93nfpp1jg"))

(define rust-is-ci-1.2.0
  (crate-source "is_ci" "1.2.0"
                "0ifwvxmrsj4r29agfzr71bjq6y1bihkx38fbzafq5vl0jn1wjmbn"))

(define rust-is-docker-0.2.0
  (crate-source "is-docker" "0.2.0"
                "1cyibrv6817cqcpf391m327ss40xlbik8wxcv5h9pj9byhksx2wj"))

(define rust-is-terminal-0.4.17
  (crate-source "is-terminal" "0.4.17"
                "0ilfr9n31m0k6fsm3gvfrqaa62kbzkjqpwcd9mc46klfig1w2h1n"))

(define rust-is-terminal-polyfill-1.70.1
  (crate-source "is_terminal_polyfill" "1.70.1"
                "1kwfgglh91z33kl0w5i338mfpa3zs0hidq5j4ny4rmjwrikchhvr"))

(define rust-is-terminal-polyfill-1.70.2
  (crate-source "is_terminal_polyfill" "1.70.2"
                "15anlc47sbz0jfs9q8fhwf0h3vs2w4imc030shdnq54sny5i7jx6"))

(define rust-is-wsl-0.4.0
  (crate-source "is-wsl" "0.4.0"
                "19bs5pq221d4bknnwiqqkqrnsx2in0fsk8fylxm1747iim4hjdhp"))

(define rust-itertools-0.12.1
  (crate-source "itertools" "0.12.1"
                "0s95jbb3ndj1lvfxyq5wanc0fm0r6hg6q4ngb92qlfdxvci10ads"))

(define rust-itertools-0.13.0
  (crate-source "itertools" "0.13.0"
                "11hiy3qzl643zcigknclh446qb9zlg4dpdzfkjaa9q9fqpgyfgj1"))

(define rust-itertools-0.14.0
  (crate-source "itertools" "0.14.0"
                "118j6l1vs2mx65dqhwyssbrxpawa90886m3mzafdvyip41w2q69b"))

(define rust-itoa-1.0.15
  (crate-source "itoa" "1.0.15"
                "0b4fj9kz54dr3wam0vprjwgygvycyw8r0qwg7vp19ly8b2w16psa"))

(define rust-itoa-1.0.16
  (crate-source "itoa" "1.0.16"
                "040hqvfkxl7mpjs54y495ch2qkxx26kbfxyydmi42k7vk8rvbrby"))

(define rust-itoa-1.0.17
  (crate-source "itoa" "1.0.17"
                "1lh93xydrdn1g9x547bd05g0d3hra7pd1k4jfd2z1pl1h5hwdv4j"))

(define rust-itoa-1.0.18
  (crate-source "itoa" "1.0.18"
                "10jnd1vpfkb8kj38rlkn2a6k02afvj3qmw054dfpzagrpl6achlg"))

(define rust-jack-0.13.4
  (crate-source "jack" "0.13.4"
                "1pfgj0xz6b1pz12fqxg0k3cfh4qr2ni1j8ry26pfac7jq82rf07g"))

(define rust-jack-sys-0.5.1
  ;; TODO: Check bundled sources.
  (crate-source "jack-sys" "0.5.1"
                "1aw6zishflmd5v9dz5yvpc5f9jsfm9pjjhzvdmbjp8lmkdhvf4v0"))

(define rust-jiff-0.2.17
  (crate-source "jiff" "0.2.17"
                "1f76bd8gfzqz4zlpxklqrg2j512xyz8h7bmv1ksl4dn20n0rnzd8"))

(define rust-jiff-0.2.18
  (crate-source "jiff" "0.2.18"
                "0l6g3vkqa7imd3nsvizmb648jn0gcadiydh3zq4rjvcxqjj8szp6"))

(define rust-jiff-static-0.2.17
  (crate-source "jiff-static" "0.2.17"
                "0n3fkwzkwply7gzmdbmbqs33l5xbmz81zi9h4q9nk29zajxvx1xp"))

(define rust-jiff-static-0.2.18
  (crate-source "jiff-static" "0.2.18"
                "0y3fks93ij3frb1jnpzi68b9kssm3rvwpmkgdjlakv4py7klxj70"))

(define rust-jni-0.21.1
  (crate-source "jni" "0.21.1"
                "15wczfkr2r45slsljby12ymf2hij8wi5b104ghck9byjnwmsm1qs"))

(define rust-jni-sys-0.3.0
  ;; TODO: Check bundled sources.
  (crate-source "jni-sys" "0.3.0"
                "0c01zb9ygvwg9wdx2fii2d39myzprnpqqhy7yizxvjqp5p04pbwf"))

(define rust-jobserver-0.1.33
  (crate-source "jobserver" "0.1.33"
                "12jkn3cxvfs7jsb6knmh9y2b41lwmrk3vdqywkmssx61jzq65wiq"))

(define rust-jobserver-0.1.35
  (crate-source "jobserver" "0.1.35"
                "1crwgbb0wjph42ni4hqryjxlv4vlr0hyk81g76id9fpa56ysq00w"))

(define rust-jpeg-decoder-0.3.2
  (crate-source "jpeg-decoder" "0.3.2"
                "01qs04rnackrc5xhw7w9difn2h3pqsdbhgdz7nqn9gklicfhz080"))

(define rust-js-sys-0.3.80
  ;; TODO: Check bundled sources.
  (crate-source "js-sys" "0.3.80"
                "0bkhnbna0a9sqhhswfar0mzi8mpy2dygv4zbzfdbm97bqnz16bw5"))

(define rust-js-sys-0.3.83
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "js-sys" "0.3.83"
                "1n71vpxrzclly0530lwkcsx6mg73lipam2ak3rr1ypzmqw4kfjj6"))

(define rust-js-sys-0.3.85
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "js-sys" "0.3.85"
                "1csmb42fxjmzjdgc790bgw77sf1cb9ydm5rdsnh5qj4miszjx54c"))

(define rust-kasuari-0.4.11
  (crate-source "kasuari" "0.4.11"
                "0nqa4gkq9jgznnqs8yxzv200lysiny4m152zgn68abk6a08hrscg"))

(define rust-keycode-1.0.0
  (crate-source "keycode" "1.0.0"
                "0xb9fawn3crmwg09i2jjbb4hg9f1h81rif51d0fflh1rscqihm19"))

(define rust-keycode-macro-1.0.0
  (crate-source "keycode_macro" "1.0.0"
                "1cnaxds4mkhcrpc410ygb47lgbwcxs768riv4qf54k85i33wrb2g"))

(define rust-khronos-api-2.2.0
  (crate-source "khronos_api" "2.2.0"
                "0m5mpi5zyzzbsjkfymfkzib577ii8lk3l5p9sgxvarrzqdrb8yh3"))

(define rust-kiddo-5.2.2
  (crate-source "kiddo" "5.2.2"
                "0wcw90lzddwavdvlp72nv886c4dv7bh2fh9ql0dzhaqk9fd4biaz"))

(define rust-kiddo-5.3.2
  (crate-source "kiddo" "5.3.2"
                "1gm33v7gpgpyc5npbzj4gqgxkn2h6aqfq02km4gm39z461v7j9ns"))

(define rust-kstring-2.0.2
  (crate-source "kstring" "2.0.2"
                "1lfvqlqkg2x23nglznb7ah6fk3vv3y5i759h5l2151ami98gk2sm"))

(define rust-lazy-static-1.5.0
  (crate-source "lazy_static" "1.5.0"
                "1zk6dqqni0193xg6iijh7i3i44sryglwgvx20spdvwk3r6sbrlmv"))

(define rust-lebe-0.5.2
  (crate-source "lebe" "0.5.2"
                "1j2l6chx19qpa5gqcw434j83gyskq3g2cnffrbl3842ymlmpq203"))

(define rust-lebe-0.5.3
  (crate-source "lebe" "0.5.3"
                "1f459clndzzm35nyd15vj5dlasyagfasp7hcgl6lh2b658rs6ybs"))

(define rust-libadwaita-0.8.1
  (crate-source "libadwaita" "0.8.1"
                "0js8slasp2y4zr4hqjbqpp70rk38fq59v0sw66rl4czpz0my22gv"))

(define rust-libadwaita-sys-0.8.1
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "libadwaita-sys" "0.8.1"
                "0c9y9azfdnbnpxvjy514fd87sdafy28j9nnazsbbazm8gci98zvd"))

(define rust-libc-0.2.174
  (crate-source "libc" "0.2.174"
                "0xl7pqvw7g2874dy3kjady2fjr4rhj5lxsnxkkhr5689jcr6jw8i"))

(define rust-libc-0.2.176
  (crate-source "libc" "0.2.176"
                "0x7ivn80h7nz2l46vra7bxx36s6r8d0lkax14dx97skjsss2kyaq"))

(define rust-libc-0.2.178
  (crate-source "libc" "0.2.178"
                "1490yks6mria93i3xdva1gm05cjz824g14mbv0ph32lxma6kvj9p"))

(define rust-libc-0.2.180
  (crate-source "libc" "0.2.180"
                "1z2n7hl10fnk1xnv19ahhqxwnb4qi9aclnl6gigim2aaahw5mhxw"))

(define rust-libc-0.2.186
  (crate-source "libc" "0.2.186"
                "0rnyhzjyqq9x56skkllbjzzzwym3r61lq3l4hqj64v71gw0r3av8"))

(define rust-libfuzzer-sys-0.4.10
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "libfuzzer-sys" "0.4.10"
                "0124z86582vyzl8gbadqscjgf9i94jcpa9mxcpsyxjvh3w71jdsh"))

(define rust-libfuzzer-sys-0.4.13
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "libfuzzer-sys" "0.4.13"
                "1li9z5q55wi81zzyifm7a4rw1xvcclsnqsqbkbvrk86bl50jzzd9"))

(define rust-libloading-0.7.4
  (crate-source "libloading" "0.7.4"
                "17wbccnjvhjd9ibh019xcd8kjvqws8lqgq86lqkpbgig7gyq0wxn"))

(define rust-libloading-0.8.9
  (crate-source "libloading" "0.8.9"
                "0mfwxwjwi2cf0plxcd685yxzavlslz7xirss3b9cbrzyk4hv1i6p"))

(define rust-libloading-0.9.0
  (crate-source "libloading" "0.9.0"
                "0q4bvhp4kqy2v3bw4cn2bmyq73hskqd1ansa9125gfq5x0ns4k3m"))

(define rust-libm-0.2.15
  (crate-source "libm" "0.2.15"
                "1plpzf0p829viazdj57yw5dhmlr8ywf3apayxc2f2bq5a6mvryzr"))

(define rust-libm-0.2.16
  (crate-source "libm" "0.2.16"
                "10brh0a3qjmbzkr5mf5xqi887nhs5y9layvnki89ykz9xb1wxlmn"))

(define rust-libpulse-binding-2.30.1
  (crate-source "libpulse-binding" "2.30.1"
                "15x3srbvqmwmhk20q9binq3cwakj59pgwnp61xl77qqnkq2b77lh"))

(define rust-libpulse-simple-binding-2.29.0
  (crate-source "libpulse-simple-binding" "2.29.0"
                "1vygcjjfy4d1ysbdwa71xhmlfdxbdzrsl96c4d5kx3hw73qbxgmp"))

(define rust-libpulse-simple-sys-1.22.0
  ;; TODO: Check bundled sources.
  (crate-source "libpulse-simple-sys" "1.22.0"
                "1g7fb0ksbli4323a5bzn3j3j856arhnfixdb2q6jgb9pzs46in9v"))

(define rust-libpulse-sys-1.23.0
  ;; TODO: Check bundled sources.
  (crate-source "libpulse-sys" "1.23.0"
                "0qayl38603vlzrfb9n2p2mqn0jfpxg9225nc57w8ks92if272hyp"))

(define rust-libredox-0.1.11
  (crate-source "libredox" "0.1.11"
                "0l7dm6b069y5skdipxg74z1ffmwz75hfxcb5b3r1rvciqbmgc5fz"))

(define rust-libredox-0.1.12
  (crate-source "libredox" "0.1.12"
                "05h6fb2y05h74zwaafmnf7gv3bxilzp7syqlfzw524w55kh9a2rx"))

(define rust-libredox-0.1.18
  (crate-source "libredox" "0.1.18"
                "0lj6dqz0pzwm32zqss320bhjryg7vymkxa575pzhc7ig6jg2ahy9"))

(define rust-libredox-0.1.4
  (crate-source "libredox" "0.1.4"
                "0f06ikfym363zrqy9llp4asgcbakz0aiq0ds0rkljdg52088100m"))

(define rust-librespot-audio-0.8.0
  (crate-source "librespot-audio" "0.8.0"
                "1zrn1nly3zdnsvlmjp3gv7kg0y6pgc7dygihhia1cn4znjn7dzmk"))

(define rust-librespot-connect-0.8.0
  (crate-source "librespot-connect" "0.8.0"
                "09ssdqha6bpvglb5m7q4d57l3m99apy1b9difrk6r44vw7lj2ajb"))

(define rust-librespot-core-0.8.0
  (crate-source "librespot-core" "0.8.0"
                "12y6n7ic13pshm11kv9x3bmj9jdn1ysxdsv9m7cxv03984fbx2qn"))

(define rust-librespot-metadata-0.8.0
  (crate-source "librespot-metadata" "0.8.0"
                "0cl5m2565z8g8mc8knr8h7qw0jdyybb9a6p3k0jfvlxcla56i74s"))

(define rust-librespot-oauth-0.8.0
  (crate-source "librespot-oauth" "0.8.0"
                "0qcnhbspiq1h15s19i1dm0hcmnk9wkb2izig75iw7ln995yl31nn"))

(define rust-librespot-playback-0.8.0
  (crate-source "librespot-playback" "0.8.0"
                "1xlak5prz9sfs74s9xdrh1ic0xwdchwidldd3zm0hs1ypwh8c9c8"))

(define rust-librespot-protocol-0.8.0
  (crate-source "librespot-protocol" "0.8.0"
                "115hc08wnyvviyz8l9dggpkrkkrv64b4l7dr5qbgm0wzsfrg009y"))

(define rust-libspa-0.9.2
  (crate-source "libspa" "0.9.2"
                "1x0dq254f60vva671css7mkwsfj357wrwsrcr6s2frk5lyiczf5n"))

(define rust-libspa-sys-0.9.2
  ;; TODO: Check bundled sources.
  (crate-source "libspa-sys" "0.9.2"
                "1q66vim2wha1rdglqn5w0i42z59pa9s5s8sqj37xxdifbm2lj44h"))

(define rust-line-clipping-0.3.5
  (crate-source "line-clipping" "0.3.5"
                "0jlakbyjc5sh4j2lx2glyjar3wqq9mqifkdzbhvhkgyxk17f8kaz"))

(define rust-linux-raw-sys-0.11.0
  ;; TODO: Check bundled sources.
  (crate-source "linux-raw-sys" "0.11.0"
                "0fghx0nn8nvbz5yzgizfcwd6ap2pislp68j8c1bwyr6sacxkq7fz"))

(define rust-linux-raw-sys-0.4.15
  ;; TODO: Check bundled sources.
  (crate-source "linux-raw-sys" "0.4.15"
                "1aq7r2g7786hyxhv40spzf2nhag5xbw2axxc1k8z5k1dsgdm4v6j"))

(define rust-litemap-0.8.1
  (crate-source "litemap" "0.8.1"
                "0xsy8pfp9s802rsj1bq2ys2kbk1g36w5dr3gkfip7gphb5x60wv3"))

(define rust-litrs-1.0.0
  (crate-source "litrs" "1.0.0"
                "14p0kzzkavnngvybl88nvfwv031cc2qx4vaxpfwsiifm8grdglqi"))

(define rust-lock-api-0.4.14
  (crate-source "lock_api" "0.4.14"
                "0rg9mhx7vdpajfxvdjmgmlyrn20ligzqvn8ifmaz7dc79gkrjhr2"))

(define rust-log-0.4.27
  (crate-source "log" "0.4.27"
                "150x589dqil307rv0rwj0jsgz5bjbwvl83gyl61jf873a7rjvp0k"))

(define rust-log-0.4.28
  (crate-source "log" "0.4.28"
                "0cklpzrpxafbaq1nyxarhnmcw9z3xcjrad3ch55mmr58xw2ha21l"))

(define rust-log-0.4.29
  (crate-source "log" "0.4.29"
                "15q8j9c8g5zpkcw0hnd6cf2z7fxqnvsjh3rw5mv5q10r83i34l2y"))

(define rust-log-0.4.33
  (crate-source "log" "0.4.33"
                "1bd9dmk22pxgnf0h0slba6rz99zb0a0b2mdhpk8p92bp26ycbvhc"))

(define rust-loop9-0.1.5
  (crate-source "loop9" "0.1.5"
                "0qphc1c0cbbx43pwm6isnwzwbg6nsxjh7jah04n1sg5h4p0qgbhg"))

(define rust-lru-0.16.3
  (crate-source "lru" "0.16.3"
                "14z5yxcp3f63lgw8yxr486g9yz7cfqbmkadfwgw36vy0jbslgp51"))

(define rust-lru-slab-0.1.2
  (crate-source "lru-slab" "0.1.2"
                "0m2139k466qj3bnpk66bwivgcx3z88qkxvlzk70vd65jq373jaqi"))

(define rust-lscolors-0.21.0
  (crate-source "lscolors" "0.21.0"
                "0a89sspsr2g5q2mhfw5v6q1dq7qk87h049kr4hnyn9hlzdnjc3nn"))

(define rust-lutgen-0.14.0
  (crate-source "lutgen" "0.14.0"
                "0xrd1ybvzikax1fdb02x2r9dr4qlyvi5ndxjw2bbbmqw9jxsvfi7"))

(define rust-lutgen-0.15.0
  (crate-source "lutgen" "0.15.0"
                "0632f5b9gyv59ybbyq9vcfzj4r048q8npqx22jdh0njrkmq88qhj"))

(define rust-lutgen-palettes-0.4.1
  (crate-source "lutgen-palettes" "0.4.1"
                "01kaydd14jq6q8x87419v0vsw8bccwmkiybpy7d5by3hizwa0vmb"))

(define rust-lutgen-palettes-0.4.2
  (crate-source "lutgen-palettes" "0.4.2"
                "0a03w5w58587w103ncjfa6g9la258p1pna5fc0110y1bzs4ygmgs"))

(define rust-mach2-0.4.3
  (crate-source "mach2" "0.4.3"
                "0i6vcnbq5v51whgyidzhf7cbxqrmj2nkw8z0m2ib02rc60mjhh6n"))

(define rust-mach2-0.5.0
  (crate-source "mach2" "0.5.0"
                "1siskhk6qhhzw40k1gc23zg6irx0bqpi1bmm8ns5bv11ak6ra6va"))

(define rust-matchit-0.8.4
  (crate-source "matchit" "0.8.4"
                "1hzl48fwq1cn5dvshfly6vzkzqhfihya65zpj7nz7lfx82mgzqa7"))

(define rust-maybe-async-0.2.10
  (crate-source "maybe-async" "0.2.10"
                "04fvg2ywb2p9dzf7i35xqfibxc05k1pirv36jswxcqg3qw82ryaw"))

(define rust-maybe-rayon-0.1.1
  (crate-source "maybe-rayon" "0.1.1"
                "06cmvhj4n36459g327ng5dnj8d58qs472pv5ahlhm7ynxl6g78cf"))

(define rust-memchr-2.7.5
  (crate-source "memchr" "2.7.5"
                "1h2bh2jajkizz04fh047lpid5wgw2cr9igpkdhl3ibzscpd858ij"))

(define rust-memchr-2.7.6
  (crate-source "memchr" "2.7.6"
                "0wy29kf6pb4fbhfksjbs05jy2f32r2f3r1ga6qkmpz31k79h0azm"))

(define rust-memchr-2.8.3
  (crate-source "memchr" "2.8.3"
                "161xa63ipfanf8v3nb82xd5hqgydv55nzw59wyngqbz6alfaz2yg"))

(define rust-memmap2-0.8.0
  (crate-source "memmap2" "0.8.0"
                "1vf3djv9s917fbvw5vclllpl22g12iph6cz11gn57ndhxwya19a3"))

(define rust-memoffset-0.9.1
  (crate-source "memoffset" "0.9.1"
                "12i17wh9a9plx869g7j4whf62xw68k5zd4k0k5nh6ys5mszid028"))

(define rust-mime-0.3.17
  (crate-source "mime" "0.3.17"
                "16hkibgvb9klh0w0jk5crr5xv90l3wlf77ggymzjmvl1818vnxv8"))

(define rust-minimal-lexical-0.2.1
  (crate-source "minimal-lexical" "0.2.1"
                "16ppc5g84aijpri4jzv14rvcnslvlpphbszc7zzp6vfkddf4qdb8"))

(define rust-miniz-oxide-0.8.9
  (crate-source "miniz_oxide" "0.8.9"
                "05k3pdg8bjjzayq3rf0qhpirq9k37pxnasfn4arbs17phqn6m9qz"))

(define rust-mio-1.0.4
  (crate-source "mio" "1.0.4"
                "073n3kam3nz8j8had35fd2nn7j6a33pi3y5w3kq608cari2d9gkq"))

(define rust-mio-1.1.1
  (crate-source "mio" "1.1.1"
                "1z2phpalqbdgihrcjp8y09l3kgq6309jnhnr6h11l9s7mnqcm6x6"))

(define rust-moxcms-0.7.11
  (crate-source "moxcms" "0.7.11"
                "15qa5znj029i7677l0hdv0lwmjggrg920bhjgs3cjvydb72mg5dc"))

(define rust-moxcms-0.8.1
  (crate-source "moxcms" "0.8.1"
                "0jz4fd5f7pdn1rngqc96lxriqjkym1lswdhdbjr037s8p9ac31dv"))

(define rust-mpris-server-0.9.0
  (crate-source "mpris-server" "0.9.0"
                "1a59mqw6m9bb34dly0f04pvhzavii3r77r1pvxlpi1i4fazf4b1r"))

(define rust-muldiv-1.0.1
  (crate-source "muldiv" "1.0.1"
                "1c6ljsp41n8ijsx7zicwfm135drgyhcms12668ivvsbm1r98frwm"))

(define rust-native-tls-0.2.14
  (crate-source "native-tls" "0.2.14"
                "03hga800x8bzkp8h7frnm7yp545dwwawgmaq673vx7byk1139pl7"))

(define rust-ndk-0.9.0
  (crate-source "ndk" "0.9.0"
                "1m32zpmi5w1pf3j47k6k5fw395dc7aj8d0mdpsv53lqkprxjxx63"))

(define rust-ndk-context-0.1.1
  (crate-source "ndk-context" "0.1.1"
                "12sai3dqsblsvfd1l1zab0z6xsnlha3xsfl7kagdnmj3an3jvc17"))

(define rust-ndk-sys-0.6.0+11769913
  ;; TODO: Check bundled sources.
  (crate-source "ndk-sys" "0.6.0+11769913"
                "0wx8r6pji20if4xs04g73gxl98nmjrfc73z0v6w1ypv6a4qdlv7f"))

(define rust-new-debug-unreachable-1.0.6
  (crate-source "new_debug_unreachable" "1.0.6"
                "11phpf1mjxq6khk91yzcbd3ympm78m3ivl7xg6lg2c0lf66fy3k5"))

(define rust-nix-0.30.1
  (crate-source "nix" "0.30.1"
                "1dixahq9hk191g0c2ydc0h1ppxj0xw536y6rl63vlnp06lx3ylkl"))

(define rust-no-std-io2-0.9.4
  (crate-source "no_std_io2" "0.9.4"
                "00w0ggkaaacbwiv4qw188ih5llmhf53qgp20wk5gdyrldldvv2j1"))

(define rust-nom-7.1.3
  (crate-source "nom" "7.1.3"
                "0jha9901wxam390jcf5pfa0qqfrgh8li787jx2ip0yk5b8y9hwyj"))

(define rust-nom-8.0.0
  (crate-source "nom" "8.0.0"
                "01cl5xng9d0gxf26h39m0l8lprgpa00fcc75ps1yzgbib1vn35yz"))

(define rust-nonzero-ext-0.3.0
  (crate-source "nonzero_ext" "0.3.0"
                "08fghyinb07xwhbj7vwvlhg45g5cvhvld2min25njidir12rdgrq"))

(define rust-noop-proc-macro-0.3.0
  (crate-source "noop_proc_macro" "0.3.0"
                "1j2v1c6ric4w9v12h34jghzmngcwmn0hll1ywly4h6lcm4rbnxh6"))

(define rust-ntapi-0.4.2
  (crate-source "ntapi" "0.4.2"
                "10ghcc1kmj5ygy4ls81as6s5akd1wflwcc0b1k3nf8ql46g223y7"))

(define rust-nu-ansi-term-0.46.0
  (crate-source "nu-ansi-term" "0.46.0"
                "115sywxh53p190lyw97alm14nc004qj5jm5lvdj608z84rbida3p"))

(define rust-nu-ansi-term-0.50.3
  (crate-source "nu-ansi-term" "0.50.3"
                "1ra088d885lbd21q1bxgpqdlk1zlndblmarn948jz2a40xsbjmvr"))

(define rust-num-bigint-0.4.6
  (crate-source "num-bigint" "0.4.6"
                "1f903zd33i6hkjpsgwhqwi2wffnvkxbn6rv4mkgcjcqi7xr4zr55"))

(define rust-num-bigint-0.4.8
  (crate-source "num-bigint" "0.4.8"
                "0ry3xjal8f5xhdinani268ci13h14mf7j4w0y1gflfzhw3knk7n8"))

(define rust-num-bigint-dig-0.8.6
  (crate-source "num-bigint-dig" "0.8.6"
                "1dxh3d8pzjc5k0kpy8gy2qhhhqs7zw8a7m564zl3ib8gcjkdsqg6"))

(define rust-num-complex-0.4.6
  (crate-source "num-complex" "0.4.6"
                "15cla16mnw12xzf5g041nxbjjm9m85hdgadd5dl5d0b30w9qmy3k"))

(define rust-num-conv-0.2.0
  (crate-source "num-conv" "0.2.0"
                "0l4hj7lp8zbb9am4j3p7vlcv47y9bbazinvnxx9zjhiwkibyr5yg"))

(define rust-num-derive-0.4.2
  (crate-source "num-derive" "0.4.2"
                "00p2am9ma8jgd2v6xpsz621wc7wbn1yqi71g15gc3h67m7qmafgd"))

(define rust-num-enum-0.7.5
  (crate-source "num_enum" "0.7.5"
                "0k25hagf3xfgmj4j1zmvja1d6844jrmpginxpd3vhmxd41z7l85i"))

(define rust-num-enum-derive-0.7.5
  (crate-source "num_enum_derive" "0.7.5"
                "1mx4dgza8b9g16baybc00gg06jn4cf17h45p0fr3qx5nw5fkccpz"))

(define rust-num-integer-0.1.46
  (crate-source "num-integer" "0.1.46"
                "13w5g54a9184cqlbsq80rnxw4jj4s0d8wv75jsq5r2lms8gncsbr"))

(define rust-num-iter-0.1.45
  (crate-source "num-iter" "0.1.45"
                "1gzm7vc5g9qsjjl3bqk9rz1h6raxhygbrcpbfl04swlh0i506a8l"))

(define rust-num-rational-0.4.2
  (crate-source "num-rational" "0.4.2"
                "093qndy02817vpgcqjnj139im3jl7vkq4h68kykdqqh577d18ggq"))

(define rust-num-threads-0.1.7
  (crate-source "num_threads" "0.1.7"
                "1ngajbmhrgyhzrlc4d5ga9ych1vrfcvfsiqz6zv0h2dpr2wrhwsw"))

(define rust-num-traits-0.2.19
  (crate-source "num-traits" "0.2.19"
                "0h984rhdkkqd4ny9cif7y2azl3xdfb7768hb9irhpsch4q3gq787"))

(define rust-number-prefix-0.4.0
  (crate-source "number_prefix" "0.4.0"
                "1wvh13wvlajqxkb1filsfzbrnq0vrmrw298v2j3sy82z1rm282w3"))

(define rust-oauth2-5.0.0
  (crate-source "oauth2" "5.0.0"
                "0zfn67m93qfh9gyxxx1hj6yprk9dkr3hm1mi4ni23pqlj3kikqji"))

(define rust-objc2-0.6.3
  (crate-source "objc2" "0.6.3"
                "01ccrb558qav2rqrmk0clzqzdd6r1rmicqnf55xqam7cw2f5khmp"))

(define rust-objc2-app-kit-0.3.2
  (crate-source "objc2-app-kit" "0.3.2"
                "132ijwni8lsi8phq7wnmialkxp46zx998fns3zq5np0ya1mr77nl"))

(define rust-objc2-audio-toolbox-0.3.2
  (crate-source "objc2-audio-toolbox" "0.3.2"
                "024vny0nxb93ihdk97q1zrbpism4i8xa7flsnycn678jj4d50j39"))

(define rust-objc2-av-foundation-0.3.2
  (crate-source "objc2-av-foundation" "0.3.2"
                "1h5nhjipihjgr88baqid7s5g13kbcry3h0l3vcc0mpy9r8zy72j7"))

(define rust-objc2-avf-audio-0.3.2
  (crate-source "objc2-avf-audio" "0.3.2"
                "1glh82g1yi74hwxy2d60hyllqhys6xcw8r80n2fykn7f3l1q18qk"))

(define rust-objc2-core-audio-0.3.2
  (crate-source "objc2-core-audio" "0.3.2"
                "1cn3d7cni2ngr18j14s4xfin3h4gqq3k2kshr3vzbgqdigmbrvp1"))

(define rust-objc2-core-audio-types-0.3.2
  (crate-source "objc2-core-audio-types" "0.3.2"
                "075xj0j67n59m6v7pa0d556l06imicg9kcj24siz832a4zng52as"))

(define rust-objc2-core-foundation-0.3.2
  (crate-source "objc2-core-foundation" "0.3.2"
                "0dnmg7606n4zifyjw4ff554xvjmi256cs8fpgpdmr91gckc0s61a"))

(define rust-objc2-core-graphics-0.3.2
  (crate-source "objc2-core-graphics" "0.3.2"
                "01x8413pxq0m5rwidlaczni8v5cz9dc3xqzq8l9zlpl9cv8cj8p0"))

(define rust-objc2-encode-4.1.0
  (crate-source "objc2-encode" "4.1.0"
                "0cqckp4cpf68mxyc2zgnazj8klv0z395nsgbafa61cjgsyyan9gg"))

(define rust-objc2-foundation-0.3.2
  (crate-source "objc2-foundation" "0.3.2"
                "0wijkxzzvw2xkzssds3fj8279cbykz2rz9agxf6qh7y2agpsvq73"))

(define rust-objc2-io-kit-0.3.2
  (crate-source "objc2-io-kit" "0.3.2"
                "05dvfcf97w39daaj5qsbfc399lw9hbx3s4h9nwgxrmlpjnizpyik"))

(define rust-objc2-io-surface-0.3.2
  (crate-source "objc2-io-surface" "0.3.2"
                "07fqx4fmwydf2arrc4xs4awv7zyzzxh60fyqdfmrpm9n148qh1qq"))

(define rust-objc2-media-player-0.3.2
  (crate-source "objc2-media-player" "0.3.2"
                "0dgnbc4d1jsn5n2sh4vv2xmaikd3xa2s39c5rc9n7rznhf2akwl5"))

(define rust-object-0.36.7
  (crate-source "object" "0.36.7"
                "11vv97djn9nc5n6w1gc6bd96d2qk2c8cg1kw5km9bsi3v4a8x532"))

(define rust-object-0.37.3
  (crate-source "object" "0.37.3"
                "1zikiy9xhk6lfx1dn2gn2pxbnfpmlkn0byd7ib1n720x0cgj0xpz"))

(define rust-oklab-1.1.2
  (crate-source "oklab" "1.1.2"
                "1k1qm6bwgy9cfbv0yiasj86b7sqs0pxygasissbvr9pgr2rmmqy1"))

(define rust-once-cell-1.21.3
  (crate-source "once_cell" "1.21.3"
                "0b9x77lb9f1j6nqgf5aka4s2qj0nly176bpbrv6f9iakk5ff3xa2"))

(define rust-once-cell-1.21.4
  (crate-source "once_cell" "1.21.4"
                "0l1v676wf71kjg2khch4dphwh1jp3291ffiymr2mvy1kxd5kwz4z"))

(define rust-once-cell-polyfill-1.70.1
  (crate-source "once_cell_polyfill" "1.70.1"
                "1bg0w99srq8h4mkl68l1mza2n2f2hvrg0n8vfa3izjr5nism32d4"))

(define rust-once-cell-polyfill-1.70.2
  (crate-source "once_cell_polyfill" "1.70.2"
                "1zmla628f0sk3fhjdjqzgxhalr2xrfna958s632z65bjsfv8ljrq"))

(define rust-open-5.3.3
  (crate-source "open" "5.3.3"
                "1g1403a17xfa136h6jshxkaa0yq2fh8sb404jycb369pzakp7fs3"))

(define rust-openssl-0.10.75
  (crate-source "openssl" "0.10.75"
                "0a238gvrzjq0r62a7472i685hi5jjzgfj72kp1xd32ir46qqv0q8"))

(define rust-openssl-macros-0.1.1
  (crate-source "openssl-macros" "0.1.1"
                "173xxvfc63rr5ybwqwylsir0vq6xsj4kxiv4hmg4c3vscdmncj59"))

(define rust-openssl-probe-0.1.6
  (crate-source "openssl-probe" "0.1.6"
                "0bl52x55laalqb707k009h8kfawliwp992rlsvkzy49n47p2fpnh"))

(define rust-openssl-src-300.5.4+3.5.4
  ;; TODO: Check bundled sources.
  (crate-source "openssl-src" "300.5.4+3.5.4"
                "0wnbqw38pzp66axaw2wz5my8nhg8f4viw74avyqfknlm55wv61x5"))

(define rust-openssl-sys-0.9.111
  ;; TODO: Check bundled sources.
  (crate-source "openssl-sys" "0.9.111"
                "08f3mpsabivfi3fd0qv9231qidqy68lr8a4qi32y6xda43av5jl2"))

(define rust-option-ext-0.2.0
  (crate-source "option-ext" "0.2.0"
                "0zbf7cx8ib99frnlanpyikm1bx8qn8x602sw1n7bg6p9x94lyx04"))

(define rust-option-operations-0.6.1
  (crate-source "option-operations" "0.6.1"
                "0m17ykxb3w68ymirnc096hsw78rf71b9psvfq40889h35gsrr8xc"))

(define rust-ordered-float-4.6.0
  (crate-source "ordered-float" "4.6.0"
                "0ldrcgilsiijd141vw51fbkziqmh5fpllil3ydhirjm67wdixdvv"))

(define rust-ordered-float-5.0.0
  (crate-source "ordered-float" "5.0.0"
                "009z1k7w729ls2sfg4zknn9v63sk1zghnq54p2lwcjjkdvszkhg2"))

(define rust-ordered-float-5.3.0
  (crate-source "ordered-float" "5.3.0"
                "03mx5yg3ncp0g524y7zbyvhwcxpd8l9v30lgybm5bhqx2v551ndp"))

(define rust-ordered-stream-0.2.0
  (crate-source "ordered-stream" "0.2.0"
                "0l0xxp697q7wiix1gnfn66xsss7fdhfivl2k7bvpjs4i3lgb18ls"))

(define rust-os-pipe-1.2.3
  (crate-source "os_pipe" "1.2.3"
                "0rqrvm7fdp790b4ks3kcdzsgkz2528xrn3vxc9l4nf1inj2ax3vx"))

(define rust-overload-0.1.1
  (crate-source "overload" "0.1.1"
                "0fdgbaqwknillagy1xq7xfgv60qdbk010diwl7s1p0qx7hb16n5i"))

(define rust-owo-colors-4.2.2
  (crate-source "owo-colors" "4.2.2"
                "0pjlic0x9gc12iv1rxc6gvvx0sw0wpq629a6s07l81c45i54zpa8"))

(define rust-owo-colors-4.3.0
  (crate-source "owo-colors" "4.3.0"
                "0kgrf4r9vcczhw5r30nkcl6abm99l0ay8dr2fxl0ymvbkcxq04fj"))

(define rust-p256-0.13.2
  (crate-source "p256" "0.13.2"
                "0jyd3c3k239ybs59ixpnl7dqkmm072fr1js8kh7ldx58bzc3m1n9"))

(define rust-p384-0.13.1
  (crate-source "p384" "0.13.1"
                "1dnnp133mbpp72mfss3fhm8wx3yp3p3abdhlix27v92j19kz2hpy"))

(define rust-p521-0.13.3
  (crate-source "p521" "0.13.3"
                "1cl5y2aypa1vxg181a0na3abndz1981pfdp2zkyml88z3wbf5j8g"))

(define rust-palette-0.7.6
  (crate-source "palette" "0.7.6"
                "1rmn02mv6cb112504qyg7pyfa83c08hxpk5sw7jc5v659hc73gsc"))

(define rust-palette-derive-0.7.6
  (crate-source "palette_derive" "0.7.6"
                "0c0xhpk1nqyq4jr2m8xnka7w47vqzc7m2vq9ih8wxyjv02phs0zm"))

(define rust-pango-0.21.5
  (crate-source "pango" "0.21.5"
                "0sgb6xls3l07f7b257rp3gjx9g6mhckhgz5pbc37l1vq41gdilaj"))

(define rust-pango-sys-0.21.5
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "pango-sys" "0.21.5"
                "1zbcw3b2i5ixzy0ds65z2xdvllifzh8m5xid7lqgzmbfsckndw5l"))

(define rust-parking-2.2.1
  (crate-source "parking" "2.2.1"
                "1fnfgmzkfpjd69v4j9x737b1k8pnn054bvzcn5dm3pkgq595d3gk"))

(define rust-parking-lot-0.12.5
  (crate-source "parking_lot" "0.12.5"
                "06jsqh9aqmc94j2rlm8gpccilqm6bskbd67zf6ypfc0f4m9p91ck"))

(define rust-parking-lot-core-0.9.12
  (crate-source "parking_lot_core" "0.9.12"
                "1hb4rggy70fwa1w9nb0svbyflzdc69h047482v2z3sx2hmcnh896"))

(define rust-password-hash-0.5.0
  (crate-source "password-hash" "0.5.0"
                "0ri1mim11zk0a9s40zdi288dfqvmdiryc7lw8vl46b59ifa08vrl"))

(define rust-paste-1.0.15
  (crate-source "paste" "1.0.15"
                "02pxffpdqkapy292harq6asfjvadgp1s005fip9ljfsn9fvxgh2p"))

(define rust-pastey-0.1.1
  (crate-source "pastey" "0.1.1"
                "1v389jkifv757903flrrps67dvc6q6giwlyx3xi33hcfjmgjxyrm"))

(define rust-pastey-0.2.1
  (crate-source "pastey" "0.2.1"
                "1v2vyc6gnk2qkwvrhzlkf67rwv4car122ix6mb9vp487gkcwlrxq"))

(define rust-pathdiff-0.2.3
  (crate-source "pathdiff" "0.2.3"
                "1lrqp4ip05df8dzldq6gb2c1sq2gs54gly8lcnv3rhav1qhwx56z"))

(define rust-pbkdf2-0.12.2
  (crate-source "pbkdf2" "0.12.2"
                "1wms79jh4flpy1zi8xdp4h8ccxv4d85adc6zjagknvppc5vnmvgq"))

(define rust-pem-rfc7468-0.7.0
  (crate-source "pem-rfc7468" "0.7.0"
                "04l4852scl4zdva31c1z6jafbak0ni5pi0j38ml108zwzjdrrcw8"))

(define rust-percent-encoding-2.3.2
  (crate-source "percent-encoding" "2.3.2"
                "083jv1ai930azvawz2khv7w73xh8mnylk7i578cifndjn5y64kwv"))

(define rust-petgraph-0.6.5
  (crate-source "petgraph" "0.6.5"
                "1ns7mbxidnn2pqahbbjccxkrqkrll2i5rbxx43ns6rh6fn3cridl"))

(define rust-phf-0.13.1
  (crate-source "phf" "0.13.1"
                "1pzswx5gdglgjgp4azyzwyr4gh031r0kcnpqq6jblga72z3jsmn1"))

(define rust-phf-generator-0.13.1
  (crate-source "phf_generator" "0.13.1"
                "0dwpp11l41dy9mag4phkyyvhpf66lwbp79q3ik44wmhyfqxcwnhk"))

(define rust-phf-macros-0.13.1
  (crate-source "phf_macros" "0.13.1"
                "1vv9h8pr7xh18sigpvq1hxc8q9nmjmv6gdpqsp65krxiahmh6bw1"))

(define rust-phf-shared-0.13.1
  (crate-source "phf_shared" "0.13.1"
                "0rpjchnswm0x5l4mz9xqfpw0j4w68sjvyqrdrv13h7lqqmmyyzz5"))

(define rust-pin-project-lite-0.2.16
  (crate-source "pin-project-lite" "0.2.16"
                "16wzc7z7dfkf9bmjin22f5282783f6mdksnr0nv0j5ym5f9gyg1v"))

(define rust-pin-project-lite-0.2.17
  (crate-source "pin-project-lite" "0.2.17"
                "1kfmwvs271si96zay4mm8887v5khw0c27jc9srw1a75ykvgj54x8"))

(define rust-pin-utils-0.1.0
  (crate-source "pin-utils" "0.1.0"
                "117ir7vslsl2z1a7qzhws4pd01cg2d3338c47swjyvqv2n60v1wb"))

(define rust-piper-0.2.4
  (crate-source "piper" "0.2.4"
                "0rn0mjjm0cwagdkay77wgmz3sqf8fqmv9d9czm79mvr2yj8c9j4n"))

(define rust-pipewire-0.9.2
  (crate-source "pipewire" "0.9.2"
                "0i4ddb89cr8x02zqy35krlx5mgkd3mqr0qbwkx4mdmqipydbi24n"))

(define rust-pipewire-sys-0.9.2
  ;; TODO: Check bundled sources.
  (crate-source "pipewire-sys" "0.9.2"
                "0dpa8q10b9cja5z5r5zgb8q27pnpla7kn3h91c11gjnnw3z8l0nb"))

(define rust-pkcs1-0.7.5
  (crate-source "pkcs1" "0.7.5"
                "0zz4mil3nchnxljdfs2k5ab1cjqn7kq5lqp62n9qfix01zqvkzy8"))

(define rust-pkcs8-0.10.2
  (crate-source "pkcs8" "0.10.2"
                "1dx7w21gvn07azszgqd3ryjhyphsrjrmq5mmz1fbxkj5g0vv4l7r"))

(define rust-pkg-config-0.3.32
  (crate-source "pkg-config" "0.3.32"
                "0k4h3gnzs94sjb2ix6jyksacs52cf1fanpwsmlhjnwrdnp8dppby"))

(define rust-png-0.17.16
  (crate-source "png" "0.17.16"
                "09kmkms9fmkbkarw0lnf0scqvjwwg3r7riddag0i3q39r0pil5c2"))

(define rust-png-0.18.0
  (crate-source "png" "0.18.0"
                "187jf0m873qn5biix8z7gjdsyf8r6vj3yr495pa0jja6i39wxflp"))

(define rust-png-0.18.1
  (crate-source "png" "0.18.1"
                "0qca282xp8a6d7mikxrwji3f52mjn4vnqxz2v9iz5adj665rnxk0"))

(define rust-polling-3.11.0
  (crate-source "polling" "3.11.0"
                "0622qfbxi3gb0ly2c99n3xawp878fkrd1sl83hjdhisx11cly3jx"))

(define rust-portable-atomic-1.12.0
  (crate-source "portable-atomic" "1.12.0"
                "1p9rrnq6fdk8byqf1q7x5jbzqwx9yaj99zg8qabmgrgimv2717pm"))

(define rust-portable-atomic-1.13.0
  (crate-source "portable-atomic" "1.13.0"
                "0l79rf3pzlxmmrylr1c4k61qn8hzs6hzz69yk738pdcvsvj7d5zq"))

(define rust-portable-atomic-util-0.2.4
  (crate-source "portable-atomic-util" "0.2.4"
                "01rmx1li07ixsx3sqg2bxqrkzk7b5n8pibwwf2589ms0s3cg18nq"))

(define rust-portaudio-rs-0.3.2
  (crate-source "portaudio-rs" "0.3.2"
                "0qnmc7amk0fzbcs985ixv0k4955f0fmpkhrl9ps9pk3cz7pvbdnd"))

(define rust-portaudio-sys-0.1.1
  ;; TODO: Check bundled sources.
  (crate-source "portaudio-sys" "0.1.1"
                "1xdpywirpr1kqkbak7hnny62gmsc93qgc3ij3j2zskrvjpxa952i"))

(define rust-potential-utf-0.1.4
  (crate-source "potential_utf" "0.1.4"
                "0xxg0pkfpq299wvwln409z4fk80rbv55phh3f1jhjajy5x1ljfdp"))

(define rust-powerfmt-0.2.0
  (crate-source "powerfmt" "0.2.0"
                "14ckj2xdpkhv3h6l5sdmb9f1d57z8hbfpdldjc2vl5givq2y77j3"))

(define rust-ppv-lite86-0.2.21
  (crate-source "ppv-lite86" "0.2.21"
                "1abxx6qz5qnd43br1dd9b2savpihzjza8gb4fbzdql1gxp2f7sl5"))

(define rust-predicates-3.1.3
  (crate-source "predicates" "3.1.3"
                "0wrm57acvagx0xmh5xffx5xspsr2kbggm698x0vks132fpjrxld5"))

(define rust-predicates-core-1.0.9
  (crate-source "predicates-core" "1.0.9"
                "1yjz144yn3imq2r4mh7k9h0r8wv4yyjjj57bs0zwkscz24mlczkj"))

(define rust-predicates-tree-1.0.12
  (crate-source "predicates-tree" "1.0.12"
                "0p223d9y02ywwxs3yl68kziswz4da4vabz67jfhp7yqx71njvpbj"))

(define rust-primal-check-0.3.4
  (crate-source "primal-check" "0.3.4"
                "025xnak4rhkwa4h970bjb3cvp2k853wviyr84n8gjfhy65dqj3fw"))

(define rust-primeorder-0.13.6
  (crate-source "primeorder" "0.13.6"
                "1rp16710mxksagcjnxqjjq9r9wf5vf72fs8wxffnvhb6i6hiqgim"))

(define rust-priority-queue-2.7.0
  (crate-source "priority-queue" "2.7.0"
                "15pg8ms12bww1fb8hp55kvkb22ximiap3gjsxm0837rdy430964k"))

(define rust-proc-macro-crate-3.4.0
  (crate-source "proc-macro-crate" "3.4.0"
                "10v9qi51n4phn1lrj5r94kjq7yhci9jrkqnn6wpan05yjsgb3711"))

(define rust-proc-macro2-1.0.101
  (crate-source "proc-macro2" "1.0.101"
                "1pijhychkpl7rcyf1h7mfk6gjfii1ywf5n0snmnqs5g4hvyl7bl9"))

(define rust-proc-macro2-1.0.103
  (crate-source "proc-macro2" "1.0.103"
                "1s29bz20xl2qk5ffs2mbdqknaj43ri673dz86axdbf47xz25psay"))

(define rust-proc-macro2-1.0.105
  (crate-source "proc-macro2" "1.0.105"
                "1rvgs5qdznlrqrgicmv24nybnrnv8kyvk2vi7s52ddna1q71hpak"))

(define rust-proc-macro2-1.0.106
  (crate-source "proc-macro2" "1.0.106"
                "0d09nczyaj67x4ihqr5p7gxbkz38gxhk4asc0k8q23g9n85hzl4g"))

(define rust-proc-macro2-1.0.107
  (crate-source "proc-macro2" "1.0.107"
                "1nb6ly8kp65f724kj73ippc7lvydss24sm2vagk6qpklpg4pwplq"))

(define rust-proc-macro2-1.0.95
  (crate-source "proc-macro2" "1.0.95"
                "0y7pwxv6sh4fgg6s715ygk1i7g3w02c0ljgcsfm046isibkfbcq2"))

(define rust-profiling-1.0.17
  (crate-source "profiling" "1.0.17"
                "0wqp6i1bl7azy9270dp92srbbr55mgdh9qnk5b1y44lyarmlif1y"))

(define rust-profiling-1.0.18
  (crate-source "profiling" "1.0.18"
                "1xdwlvxlgy99nn1dra7arzinkc8lbqljvcwpq70m7g16lda5wn9x"))

(define rust-profiling-procmacros-1.0.17
  (crate-source "profiling-procmacros" "1.0.17"
                "0nrxdh5r723raxbs136jmjx46p0c5qgai8jwz4j555mn0ad7ywaj"))

(define rust-profiling-procmacros-1.0.18
  (crate-source "profiling-procmacros" "1.0.18"
                "1jxvqff6j1z7ph3qghw2xhv18z7pf6cs6cja6fwscjwsdfis9224"))

(define rust-protobuf-3.7.2
  (crate-source "protobuf" "3.7.2"
                "1x4riz4znnjsqpdxnhxj0aq8rfivmbv4hfqmd3gbbn77v96isnnn"))

(define rust-protobuf-codegen-3.7.2
  (crate-source "protobuf-codegen" "3.7.2"
                "1kjaakqk0595akxdhv68w23zw136hw0h0kxkyg9bn500bj17cfax"))

(define rust-protobuf-json-mapping-3.7.2
  (crate-source "protobuf-json-mapping" "3.7.2"
                "07fbgwcg27i84xx15wbxzabjv3ij8d91kyh2bj50scbvcfzf9mp0"))

(define rust-protobuf-parse-3.7.2
  (crate-source "protobuf-parse" "3.7.2"
                "0wy9pnfrsk2iz2ghhvzdpp0riklrm6p8dvdfxr4d7wb04hgsmbml"))

(define rust-protobuf-support-3.7.2
  (crate-source "protobuf-support" "3.7.2"
                "1mnpn2q96bxm2vidh86m5p2x5z0z8rgfyixk1wlgjiqa3vrw4diy"))

(define rust-pulp-0.22.3
  (crate-source "pulp" "0.22.3"
                "0sj9294yb8yr6z7vdlx467cfs4vvcwnygj0p8wpfqhlnk1ds8sh4"))

(define rust-pulp-wasm-simd-flag-0.1.1
  (crate-source "pulp-wasm-simd-flag" "0.1.1"
                "0h67yf9psibw4768lihrcidsdfqiqnhrrrblbaa64fcwggh713qx"))

(define rust-pxfm-0.1.27
  (crate-source "pxfm" "0.1.27"
                "1a76ydn3wpl2dvyzplv3c6fkx4mkjc9ns60xas9l7alk4n1d71ki"))

(define rust-pxfm-0.1.30
  (crate-source "pxfm" "0.1.30"
                "1slrnbxd0nc96sny6x50ss1sm9ci0gig0fp1w8mw0pkgm5prapfm"))

(define rust-qoi-0.4.1
  (crate-source "qoi" "0.4.1"
                "00c0wkb112annn2wl72ixyd78mf56p4lxkhlmsggx65l3v3n8vbz"))

(define rust-quantette-0.3.0
  (crate-source "quantette" "0.3.0"
                "0vn983ipw4lpdmffriimx5pvjk0j7kpq7hgpl7746pdm9arshfss"))

(define rust-quick-error-2.0.1
  (crate-source "quick-error" "2.0.1"
                "18z6r2rcjvvf8cn92xjhm2qc3jpd1ljvcbf12zv0k9p565gmb4x9"))

(define rust-quick-xml-0.37.5
  (crate-source "quick-xml" "0.37.5"
                "1yxpd7rc2qn6f4agfj47ps2z89vv7lvzxpzawqirix8bmyhrf7ik"))

(define rust-quick-xml-0.38.4
  (crate-source "quick-xml" "0.38.4"
                "0772siy4d9vlq77842012c8cycs3y0szxkv62rh9sh2sqmc20v5n"))

(define rust-quinn-0.11.9
  (crate-source "quinn" "0.11.9"
                "086gzj666dr3slmlynkvxlndy28hahgl361d6bf93hk3i6ahmqmr"))

(define rust-quinn-proto-0.11.13
  (crate-source "quinn-proto" "0.11.13"
                "0cca3mgja9p4w66f6sl1kfhj8rdf4mwsg1jxzssh9g63n14np47i"))

(define rust-quinn-udp-0.5.14
  (crate-source "quinn-udp" "0.5.14"
                "1gacawr17a2zkyri0r3m0lc9spzmxbq1by3ilyb8v2mdvjhcdpmd"))

(define rust-quote-1.0.40
  (crate-source "quote" "1.0.40"
                "1394cxjg6nwld82pzp2d4fp6pmaz32gai1zh9z5hvh0dawww118q"))

(define rust-quote-1.0.42
  (crate-source "quote" "1.0.42"
                "0zq6yc7dhpap669m27rb4qfbiywxfah17z6fwvfccv3ys90wqf53"))

(define rust-quote-1.0.43
  (crate-source "quote" "1.0.43"
                "02n41mlr81qmczac7m5kjy51y8b7yrb8ym4ncmjycampjjjxjx6w"))

(define rust-quote-1.0.44
  (crate-source "quote" "1.0.44"
                "1r7c7hxl66vz3q9qizgjhy77pdrrypqgk4ghc7260xvvfb7ypci1"))

(define rust-quote-1.0.47
  (crate-source "quote" "1.0.47"
                "00ch0yyzvv6s671ik0kcsbw8nigdaj2g3fr61kcahwx48aqlvgqz"))

(define rust-r-efi-5.3.0
  (crate-source "r-efi" "5.3.0"
                "03sbfm3g7myvzyylff6qaxk4z6fy76yv860yy66jiswc2m6b7kb9"))

(define rust-r-efi-6.0.0
  (crate-source "r-efi" "6.0.0"
                "1gyrl2k5fyzj9k7kchg2n296z5881lg7070msabid09asp3wkp7q"))

(define rust-radium-0.7.0
  (crate-source "radium" "0.7.0"
                "02cxfi3ky3c4yhyqx9axqwhyaca804ws46nn4gc1imbk94nzycyw"))

(define rust-rand-0.10.2
  (crate-source "rand" "0.10.2"
                "105yqkdzqbgggd3r1yjm9jg0zvibfdsmxylvxxkmblwc0lxgmxf7"))

(define rust-rand-0.8.5
  (crate-source "rand" "0.8.5"
                "013l6931nn7gkc23jz5mm3qdhf93jjf0fg64nz2lp4i51qd8vbrl"))

(define rust-rand-0.8.7
  (crate-source "rand" "0.8.7"
                "06iaf16fr0z8zly7anmn8ky0p80xnx9yv0gdcm30fwn9vqmigxi2"))

(define rust-rand-0.9.1
  (crate-source "rand" "0.9.1"
                "15yxfcxbgmwba5cv7mjg9bhc1r5c9483dfcdfspg62x4jk8dkgwz"))

(define rust-rand-0.9.2
  (crate-source "rand" "0.9.2"
                "1lah73ainvrgl7brcxx0pwhpnqa3sm3qaj672034jz8i0q7pgckd"))

(define rust-rand-0.9.5
  (crate-source "rand" "0.9.5"
                "0hbvllk8g28mqjld6hqmckk69w296qpzg95whm3didsyg46ivvxr"))

(define rust-rand-chacha-0.3.1
  (crate-source "rand_chacha" "0.3.1"
                "123x2adin558xbhvqb8w4f6syjsdkmqff8cxwhmjacpsl1ihmhg6"))

(define rust-rand-chacha-0.9.0
  (crate-source "rand_chacha" "0.9.0"
                "1jr5ygix7r60pz0s1cv3ms1f6pd1i9pcdmnxzzhjc3zn3mgjn0nk"))

(define rust-rand-core-0.10.1
  (crate-source "rand_core" "0.10.1"
                "0s9wiacxrr100icl7i41308gcj85nlcclrc5jx1jd6p10dhigf33"))

(define rust-rand-core-0.6.4
  (crate-source "rand_core" "0.6.4"
                "0b4j2v4cb5krak1pv6kakv4sz6xcwbrmy2zckc32hsigbrwy82zc"))

(define rust-rand-core-0.9.3
  (crate-source "rand_core" "0.9.3"
                "0f3xhf16yks5ic6kmgxcpv1ngdhp48mmfy4ag82i1wnwh8ws3ncr"))

(define rust-rand-core-0.9.5
  (crate-source "rand_core" "0.9.5"
                "0g6qc5r3f0hdmz9b11nripyp9qqrzb0xqk9piip8w8qlvqkcibvn"))

(define rust-rand-distr-0.4.3
  (crate-source "rand_distr" "0.4.3"
                "0cgfwg3z0pkqhrl0x90c77kx70r6g9z4m6fxq9v0h2ibr2dhpjrj"))

(define rust-rand-distr-0.5.1
  (crate-source "rand_distr" "0.5.1"
                "0qvlzxq4a2rvrf3wq0xq1bfw8iy9zqm6jlmbywqzld6g1paib1ka"))

(define rust-rand-distr-0.6.0
  (crate-source "rand_distr" "0.6.0"
                "1n61c943yzpwxkirxmvagnwj5fwyyh1kq9a59pg2kwfc0ckiqhsd"))

(define rust-rand-xoshiro-0.6.0
  (crate-source "rand_xoshiro" "0.6.0"
                "1ajsic84rzwz5qr0mzlay8vi17swqi684bqvwqyiim3flfrcv5vg"))

(define rust-ratatui-0.30.0
  (crate-source "ratatui" "0.30.0"
                "1g36h96fnr8ay7bmwplxsfa5xzsp0pdaxny8s5a68i54igxngkni"))

(define rust-ratatui-core-0.1.0
  (crate-source "ratatui-core" "0.1.0"
                "14y2pv5njy7kpzjsfn20a8vmjbhnfq5vgbgppxrszjljkahdxy2y"))

(define rust-ratatui-crossterm-0.1.0
  (crate-source "ratatui-crossterm" "0.1.0"
                "1cslvh75a29gdmz84s5sjaqd61k4s0fkjsjwn8gi4k1bcngrnz2p"))

(define rust-ratatui-widgets-0.3.0
  (crate-source "ratatui-widgets" "0.3.0"
                "1nqjcrskazvfgjkmmsifliqrvap8bw6850rlap109rnl7h1gmnyp"))

(define rust-raunch-1.0.1
  (crate-source "raunch" "1.0.1"
                "1ia9mfxpsvpdr0dzcr1kb6q911nmyw26x0jwbz2ikm6ci5kj4rqs"))

(define rust-rav1e-0.7.1
  (crate-source "rav1e" "0.7.1"
                "1sawva6nmj2fvynydbcirr3nb7wjyg0id2hz2771qnv6ly0cx1yd"))

(define rust-rav1e-0.8.1
  (crate-source "rav1e" "0.8.1"
                "0axk3ji3jmlr81svmsy5zvj8shmhpp8lz5nyghkq752xx1bdvdj3"))

(define rust-ravif-0.11.20
  (crate-source "ravif" "0.11.20"
                "0sryi4qzwv3rjhy4h0z9fb0zw3k3i814j3ck2psvjsnivmpw49aq"))

(define rust-ravif-0.13.0
  (crate-source "ravif" "0.13.0"
                "0ifcpczxf6kcsqlky08vbjrvw9yd1m9mfszywxdhy6wpglci08z5"))

(define rust-raw-cpuid-11.6.0
  (crate-source "raw-cpuid" "11.6.0"
                "11j1lmrjqqnc43bxkrz0xai1g9piw3z9aap53qsj8cnpb7fd1329"))

(define rust-rayon-1.10.0
  (crate-source "rayon" "1.10.0"
                "1ylgnzwgllajalr4v00y4kj22klq2jbwllm70aha232iah0sc65l"))

(define rust-rayon-1.11.0
  (crate-source "rayon" "1.11.0"
                "13x5fxb7rn4j2yw0cr26n7782jkc7rjzmdkg42qxk3xz0p8033rn"))

(define rust-rayon-1.12.0
  (crate-source "rayon" "1.12.0"
                "0vcj63xgnk72c30vdrak7dhl53snnaqv9x2faf1d94hzg1kb2fgv"))

(define rust-rayon-core-1.12.1
  (crate-source "rayon-core" "1.12.1"
                "1qpwim68ai5h0j7axa8ai8z0payaawv3id0lrgkqmapx7lx8fr8l"))

(define rust-rayon-core-1.13.0
  (crate-source "rayon-core" "1.13.0"
                "14dbr0sq83a6lf1rfjq5xdpk5r6zgzvmzs5j6110vlv2007qpq92"))

(define rust-realfft-3.5.0
  (crate-source "realfft" "3.5.0"
                "0xw6xbb02kkk7rhp8xh7pa6q5wzvy7llcb1l2s8hi7drvn7k68gq"))

(define rust-reborrow-0.5.5
  (crate-source "reborrow" "0.5.5"
                "0c14ccj3fdf47a1ya21bkxqv7s2hxrcfhaw98aqd6jqg029i2983"))

(define rust-redox-syscall-0.5.18
  (crate-source "redox_syscall" "0.5.18"
                "0b9n38zsxylql36vybw18if68yc9jczxmbyzdwyhb9sifmag4azd"))

(define rust-redox-syscall-0.7.0
  (crate-source "redox_syscall" "0.7.0"
                "09zfw2jp6hgpn5pkayv9wh01sw410566qk8zwkljm7p6i44gxws9"))

(define rust-redox-users-0.5.0
  (crate-source "redox_users" "0.5.0"
                "0awxx66izdw6kz97r3zxrl5ms5f6dqi5l0f58mlsvlmx8wyrsvyx"))

(define rust-redox-users-0.5.2
  (crate-source "redox_users" "0.5.2"
                "1b17q7gf7w8b1vvl53bxna24xl983yn7bd00gfbii74bcg30irm4"))

(define rust-regex-1.11.1
  (crate-source "regex" "1.11.1"
                "148i41mzbx8bmq32hsj1q4karkzzx5m60qza6gdw4pdc9qdyyi5m"))

(define rust-regex-1.11.2
  (crate-source "regex" "1.11.2"
                "04k9rzxd11hcahpyihlswy6f1zqw7lspirv4imm4h0lcdl8gvmr3"))

(define rust-regex-1.12.2
  (crate-source "regex" "1.12.2"
                "1m14zkg6xmkb0q5ah3y39cmggclsjdr1wpxfa4kf5wvm3wcw0fw4"))

(define rust-regex-1.13.1
  (crate-source "regex" "1.13.1"
                "1391a0a4100ik8cp7l577p3ip3haqq03rd9c5vdr7vcfdixj687h"))

(define rust-regex-automata-0.4.10
  (crate-source "regex-automata" "0.4.10"
                "1mllcfmgjcl6d52d5k09lwwq9wj5mwxccix4bhmw5spy1gx5i53b"))

(define rust-regex-automata-0.4.13
  (crate-source "regex-automata" "0.4.13"
                "070z0j23pjfidqz0z89id1fca4p572wxpcr20a0qsv68bbrclxjj"))

(define rust-regex-automata-0.4.16
  (crate-source "regex-automata" "0.4.16"
                "1b8ihxq99g3hr8mr37bvhib4bfn8rlmpmp0wjg2q1j50plvdpkwg"))

(define rust-regex-automata-0.4.9
  (crate-source "regex-automata" "0.4.9"
                "02092l8zfh3vkmk47yjc8d631zhhcd49ck2zr133prvd3z38v7l0"))

(define rust-regex-syntax-0.8.11
  (crate-source "regex-syntax" "0.8.11"
                "1m25h5q2wp976fb9gc3dsc9l99svcvd5cri8lncb51c46ydgzxnn"))

(define rust-regex-syntax-0.8.5
  (crate-source "regex-syntax" "0.8.5"
                "0p41p3hj9ww7blnbwbj9h7rwxzxg0c1hvrdycgys8rxyhqqw859b"))

(define rust-regex-syntax-0.8.6
  (crate-source "regex-syntax" "0.8.6"
                "00chjpglclfskmc919fj5aq308ffbrmcn7kzbkz92k231xdsmx6a"))

(define rust-regex-syntax-0.8.8
  (crate-source "regex-syntax" "0.8.8"
                "0n7ggnpk0r32rzgnycy5xrc1yp2kq19m6pz98ch3c6dkaxw9hbbs"))

(define rust-region-3.0.2
  (crate-source "region" "3.0.2"
                "19wrf7fg741jfnyz2314dv9m9hwssh816v27rpwsw2f07g8ypdp6"))

(define rust-relm4-0.10.1
  (crate-source "relm4" "0.10.1"
                "0wm411qc48rbc8jkc8pfxqibb86822p543wj7r70d16912fnf08p"))

(define rust-relm4-css-0.10.1
  (crate-source "relm4-css" "0.10.1"
                "05ibbj60rzhl9v2909jf7bl7ygzab565pnpabyvqsqa13ng2ipxi"))

(define rust-relm4-icons-0.10.1
  (crate-source "relm4-icons" "0.10.1"
                "1pkrgvihazn8qmqp7zh0w273zzh66qn7w8ghpmgw7kk05p25bn4q"))

(define rust-relm4-icons-build-0.10.1
  (crate-source "relm4-icons-build" "0.10.1"
                "0vcy533jfxjxn3186akp5rcnhvz2bihch9srdfsk1f8858ggxab9"))

(define rust-relm4-macros-0.10.1
  (crate-source "relm4-macros" "0.10.1"
                "07lp8cr7n912vybxrl7f1cazq2iirm45rs6q3mgrf9l15rdvpv95"))

(define rust-reqwest-0.12.28
  (crate-source "reqwest" "0.12.28"
                "0iqidijghgqbzl3bjg5hb4zmigwa4r612bgi0yiq0c90b6jkrpgd"))

(define rust-resource-0.6.1
  (crate-source "resource" "0.6.1"
                "0xl1sq95x7l7j3fg3drbxm4mkff3lcm1yjynpgbr70gr7hi54ygp"))

(define rust-resource-list-proc-macro-0.6.1
  (crate-source "resource_list_proc_macro" "0.6.1"
                "05p828pfcgcc9gp0x4ycxj0m2lh2rjis6bwfbpj4izbxywx7vrys"))

(define rust-rfc6979-0.4.0
  (crate-source "rfc6979" "0.4.0"
                "1chw95jgcfrysyzsq6a10b1j5qb7bagkx8h0wda4lv25in02mpgq"))

(define rust-rgb-0.8.52
  (crate-source "rgb" "0.8.52"
                "1km115a9lblf9pldvx51dmmg30y8ms4ka67hvas2ndcq556qhshc"))

(define rust-rgb-0.8.53
  (crate-source "rgb" "0.8.53"
                "1i0c55whln68zs6f5qqrkbg1mzai0p3qk1mwkwzdgr9i3dw4pcs7"))

(define rust-ring-0.17.14
  (crate-source "ring" "0.17.14"
                "1dw32gv19ccq4hsx3ribhpdzri1vnrlcfqb2vj41xn4l49n9ws54"))

(define rust-rmp-0.8.15
  (crate-source "rmp" "0.8.15"
                "033rwyzxyj5f7iviacvcz1y2wmlbadw1cma2anrwkckjsdrbxa2b"))

(define rust-rmpv-1.3.1
  (crate-source "rmpv" "1.3.1"
                "05w4vz0r2lmly1km0dy1ab35c2fay0lk5wvak792d2lkkd5iskks"))

(define rust-rodio-0.21.1
  (crate-source "rodio" "0.21.1"
                "10z134ip496n1vx2v8lz0mdd17vqbrsm6gbapqv37q22wxcwy3p4"))

(define rust-roff-0.2.2
  (crate-source "roff" "0.2.2"
                "1wyqz6m0pm4p6wzhwhahvcidfm7nwb38zl4q7ha940pn3w66dy48"))

(define rust-rsa-0.9.10
  (crate-source "rsa" "0.9.10"
                "0bdikdwhcvl1gfh4637m5rdw3fgcl752aiygvzmwlgc8yl1kymxq"))

(define rust-rsa-0.9.9
  (crate-source "rsa" "0.9.9"
                "122wywpd4m3v183sj7gzykqi5qkvgfzy8hynv5wq4dfha1n3g820"))

(define rust-rspotify-0.14.0
  (crate-source "rspotify" "0.14.0"
                "0xfllmzp8fi58x8iaz6hdg1hxm92v60ihcwi72mk95a49cjz7r4p"))

(define rust-rspotify-http-0.14.0
  (crate-source "rspotify-http" "0.14.0"
                "1nk08g31rvgnfmqbwrw6cpvq93fbwmk27q1n4h5098zy7innp2pd"))

(define rust-rspotify-macros-0.14.0
  (crate-source "rspotify-macros" "0.14.0"
                "1ncmigii00xlixd15xfrbjshrp81c10fzj2w7h4pqa9rns1av7sm"))

(define rust-rspotify-model-0.14.0
  (crate-source "rspotify-model" "0.14.0"
                "15bxh8xk04a4alcf7mwmjw4miy5hlrlc3l7hb60dvll9md2h7l4c"))

(define rust-rustc-demangle-0.1.26
  (crate-source "rustc-demangle" "0.1.26"
                "1kja3nb0yhlm4j2p1hl8d7sjmn2g9fa1s4pj0qma5kj2lcndkxsn"))

(define rust-rustc-demangle-0.1.27
  (crate-source "rustc-demangle" "0.1.27"
                "17f0jl6lgsy8kwxdzxp3s2wmipvlpna03kkc4vkqr1gwv5lqh2xm"))

(define rust-rustc-hash-2.1.1
  (crate-source "rustc-hash" "2.1.1"
                "03gz5lvd9ghcwsal022cgkq67dmimcgdjghfb5yb5d352ga06xrm"))

(define rust-rustc-version-0.4.1
  (crate-source "rustc_version" "0.4.1"
                "14lvdsmr5si5qbqzrajgb6vfn69k0sfygrvfvr2mps26xwi3mjyg"))

(define rust-rustfft-6.4.1
  (crate-source "rustfft" "6.4.1"
                "12fvi8naf08vc0c1lg3hfikcl4d6vcvh0s48iiwl27z9jfc5znr1"))

(define rust-rustix-0.38.44
  (crate-source "rustix" "0.38.44"
                "0m61v0h15lf5rrnbjhcb9306bgqrhskrqv7i1n0939dsw8dbrdgx"))

(define rust-rustix-1.1.3
  (crate-source "rustix" "1.1.3"
                "0d0z2zcw4rwzni1hm8snw8xdxwwrij336m31c4ghq66cghj9wv0l"))

(define rust-rustls-0.23.35
  (crate-source "rustls" "0.23.35"
                "13xxk2qqchibd7pr0laqq6pzayx9xm4rb45d8rz68kvxday58gsk"))

(define rust-rustls-0.23.36
  (crate-source "rustls" "0.23.36"
                "06w0077ssk3blpp93613lkny046mwj0nhxjgc7cmg9nf70yz6rf6"))

(define rust-rustls-native-certs-0.8.2
  (crate-source "rustls-native-certs" "0.8.2"
                "08vr6gyz78c4zmbi8r307pybyrs7hf81wl5s35hm7h5hxcbxk04r"))

(define rust-rustls-pki-types-1.13.2
  (crate-source "rustls-pki-types" "1.13.2"
                "10hjgkw4y5bjkm08j5dskcwpl9qajayshdk7p28l5ji856mz5ri1"))

(define rust-rustls-pki-types-1.14.0
  (crate-source "rustls-pki-types" "1.14.0"
                "1p9zsgslvwzzkzhm6bqicffqndr4jpx67992b0vl0pi21a5hy15y"))

(define rust-rustls-webpki-0.103.8
  (crate-source "rustls-webpki" "0.103.8"
                "0lpymb84bi5d2pm017n39nbiaa5cd046hgz06ir29ql6a8pzmz9g"))

(define rust-rustls-webpki-0.103.9
  (crate-source "rustls-webpki" "0.103.9"
                "0lwg1nnyv7pp2lfwwjhy81bxm233am99jnsp3iymdhd6k8827pyp"))

(define rust-rustversion-1.0.21
  (crate-source "rustversion" "1.0.21"
                "07bb1xx05hhwpnl43sqrhsmxyk5sd5m5baadp19nxp69s9xij3ca"))

(define rust-rustversion-1.0.22
  (crate-source "rustversion" "1.0.22"
                "0vfl70jhv72scd9rfqgr2n11m5i9l1acnk684m2w83w0zbqdx75k"))

(define rust-rustversion-1.0.23
  (crate-source "rustversion" "1.0.23"
                "07z2a843fs80fawwflj9jwn49k9b0bd0dhhbvy0ar69vaxd72m6g"))

(define rust-rustybuzz-0.20.1
  (crate-source "rustybuzz" "0.20.1"
                "00hp1gwykjfli258zs7lqg8p2zdh94dv2mw8zx7f73m0z2b7qg7x"))

(define rust-ryu-1.0.20
  (crate-source "ryu" "1.0.20"
                "07s855l8sb333h6bpn24pka5sp7hjk2w667xy6a0khkf6sqv5lr8"))

(define rust-ryu-1.0.21
  (crate-source "ryu" "1.0.21"
                "1sja0gi4s0h3yjrx7hky72vivhzx73p5dllsiwg844mzfwl9n132"))

(define rust-ryu-1.0.22
  (crate-source "ryu" "1.0.22"
                "1139acr2kd4n8p36bp1n42xrpaphn6dhwklnazh8hpdnfps4q3x5"))

(define rust-safe-arch-0.7.4
  (crate-source "safe_arch" "0.7.4"
                "08sk47n1kcm5w2di6bpgi2hsw8r2caz2230pwqvbdqfv5pl2vc4n"))

(define rust-same-file-1.0.6
  (crate-source "same-file" "1.0.6"
                "00h5j1w87dmhnvbv9l8bic3y7xxsnjmssvifw2ayvgx9mb1ivz4k"))

(define rust-schannel-0.1.28
  (crate-source "schannel" "0.1.28"
                "1qb6s5gyxfz2inz753a4z3mc1d266mwvz0c5w7ppd3h44swq27c9"))

(define rust-scopeguard-1.2.0
  (crate-source "scopeguard" "1.2.0"
                "0jcz9sd47zlsgcnm1hdw0664krxwb5gczlif4qngj2aif8vky54l"))

(define rust-sdl2-0.38.0
  (crate-source "sdl2" "0.38.0"
                "1vzyx78fi8p9xx4m5l7fm9axrjrlpaw80bpr6rzbd2kazix40hid"))

(define rust-sdl2-sys-0.38.0
  ;; TODO: Check bundled sources.
  (crate-source "sdl2-sys" "0.38.0"
                "1h7a4dc0jdis017lm3pgzdjrjhwnq7bf9irxr6xv1m3mzh3i9xiz"))

(define rust-sec1-0.7.3
  (crate-source "sec1" "0.7.3"
                "1p273j8c87pid6a1iyyc7vxbvifrw55wbxgr0dh3l8vnbxb7msfk"))

(define rust-secrecy-0.8.0
  (crate-source "secrecy" "0.8.0"
                "07p9h2bpkkg61f1fzzdqqbf74kwv1gg095r1cdmjzzbcl17cblcv"))

(define rust-security-framework-2.11.1
  (crate-source "security-framework" "2.11.1"
                "00ldclwx78dm61v7wkach9lcx76awlrv0fdgjdwch4dmy12j4yw9"))

(define rust-security-framework-3.5.1
  (crate-source "security-framework" "3.5.1"
                "1vz6pf5qjgx8s0hg805hq6qbcqnll6fs63irvrpgcc7qx91p6adk"))

(define rust-security-framework-sys-2.15.0
  ;; TODO: Check bundled sources.
  (crate-source "security-framework-sys" "2.15.0"
                "1h6mijxnfrwvl1y4dzwn3m877j6dqp9qn3g37i954j5czazhq7yc"))

(define rust-self-replace-1.5.0
  (crate-source "self-replace" "1.5.0"
                "1drganasvf5b0x6c9g60jkfhzjc9in3r6cznjfw0lhmbbrdq3v03"))

(define rust-self-update-0.42.0
  (crate-source "self_update" "0.42.0"
                "0p3vwhj44z75z44722z4x4py3xmq351bnir9zclwrnp0xj3c0cnq"))

(define rust-semver-1.0.27
  (crate-source "semver" "1.0.27"
                "1qmi3akfrnqc2hfkdgcxhld5bv961wbk8my3ascv5068mc5fnryp"))

(define rust-serde-1.0.219
  (crate-source "serde" "1.0.219"
                "1dl6nyxnsi82a197sd752128a4avm6mxnscywas1jq30srp2q3jz"))

(define rust-serde-1.0.228
  (crate-source "serde" "1.0.228"
                "17mf4hhjxv5m90g42wmlbc61hdhlm6j9hwfkpcnd72rpgzm993ls"))

(define rust-serde-1.0.229
  (crate-source "serde" "1.0.229"
                "1fp04fq4a79bpm61xz1zy0pbz4kpc7d771zii1k3inmszq55jj21"))

(define rust-serde-core-1.0.228
  (crate-source "serde_core" "1.0.228"
                "1bb7id2xwx8izq50098s5j2sqrrvk31jbbrjqygyan6ask3qbls1"))

(define rust-serde-core-1.0.229
  (crate-source "serde_core" "1.0.229"
                "0j1ajiha76h3nmd976il9li6975k121xa7jb39ws8n0yqp4s5p37"))

(define rust-serde-derive-1.0.219
  (crate-source "serde_derive" "1.0.219"
                "001azhjmj7ya52pmfiw4ppxm16nd44y15j2pf5gkcwrcgz7pc0jv"))

(define rust-serde-derive-1.0.228
  (crate-source "serde_derive" "1.0.228"
                "0y8xm7fvmr2kjcd029g9fijpndh8csv5m20g4bd76w8qschg4h6m"))

(define rust-serde-derive-1.0.229
  (crate-source "serde_derive" "1.0.229"
                "0j4k63i7h1bikxwz2c89ig0hrwbnl9mz1czn85xx99x5cc9dg9g7"))

(define rust-serde-json-1.0.140
  (crate-source "serde_json" "1.0.140"
                "0wwkp4vc20r87081ihj3vpyz5qf7wqkqipq17v99nv6wjrp8n1i0"))

(define rust-serde-json-1.0.147
  (crate-source "serde_json" "1.0.147"
                "1r3s8hqwqrrmb8ikdf8yg6lnm8z8sxycp7iycwz3852ka0jlgwba"))

(define rust-serde-json-1.0.149
  (crate-source "serde_json" "1.0.149"
                "11jdx4vilzrjjd1dpgy67x5lgzr0laplz30dhv75lnf5ffa07z43"))

(define rust-serde-json-1.0.151
  (crate-source "serde_json" "1.0.151"
                "051zww7lvpw147vvwss1ng6w587qyrkzg75fvj08q2dfrmgbahf8"))

(define rust-serde-path-to-error-0.1.20
  (crate-source "serde_path_to_error" "0.1.20"
                "0mxls44p2ycmnxh03zpnlxxygq42w61ws7ir7r0ba6rp5s1gza8h"))

(define rust-serde-repr-0.1.20
  (crate-source "serde_repr" "0.1.20"
                "1755gss3f6lwvv23pk7fhnjdkjw7609rcgjlr8vjg6791blf6php"))

(define rust-serde-spanned-0.6.9
  (crate-source "serde_spanned" "0.6.9"
                "18vmxq6qfrm110caszxrzibjhy2s54n1g5w1bshxq9kjmz7y0hdz"))

(define rust-serde-spanned-1.0.0
  (crate-source "serde_spanned" "1.0.0"
                "10rv91337k8x8zmfir4h8aiwmwgkq07gdv7h0jxhcwwgk10lqws0"))

(define rust-serde-spanned-1.0.4
  (crate-source "serde_spanned" "1.0.4"
                "0xkp0qdzams5sqwndbw3xrhf4c0bb5r46w2ywkp1aqsdb8ggkfzq"))

(define rust-serde-spanned-1.1.1
  (crate-source "serde_spanned" "1.1.1"
                "09jzk7i6wihn3d8i3wi4j4n98ghi93c3b8m8k64nxq0ijn3vaqk6"))

(define rust-serde-urlencoded-0.7.1
  (crate-source "serde_urlencoded" "0.7.1"
                "1zgklbdaysj3230xivihs30qi5vkhigg323a9m62k8jwf4a1qjfk"))

(define rust-serde-yaml-0.9.34+deprecated
  (crate-source "serde_yaml" "0.9.34+deprecated"
                "0isba1fjyg3l6rxk156k600ilzr8fp7crv82rhal0rxz5qd1m2va"))

(define rust-service-binding-3.0.0
  (crate-source "service-binding" "3.0.0"
                "1s6n10jcv9prdx33bajv7vdpli7507yv7vc367w3w6c3iffknri5"))

(define rust-sha1-0.10.6
  (crate-source "sha1" "0.10.6"
                "1fnnxlfg08xhkmwf2ahv634as30l1i3xhlhkvxflmasi5nd85gz3"))

(define rust-sha2-0.10.9
  (crate-source "sha2" "0.10.9"
                "10xjj843v31ghsksd9sl9y12qfc48157j1xpb8v1ml39jy0psl57"))

(define rust-shannon-0.2.0
  (crate-source "shannon" "0.2.0"
                "0qa52zs4y1i87ysr11g9p6shpdagl14bb340gfm6rd97jhfb99by"))

(define rust-sharded-slab-0.1.7
  (crate-source "sharded-slab" "0.1.7"
                "1xipjr4nqsgw34k7a2cgj9zaasl2ds6jwn89886kww93d32a637l"))

(define rust-shared-library-0.1.9
  (crate-source "shared_library" "0.1.9"
                "04fs37kdak051hm524a360978g58ayrcarjsbf54vqps5c7px7js"))

(define rust-shell-words-1.1.1
  (crate-source "shell-words" "1.1.1"
                "0xzd5p53xl0ndnk63r0by52rhdrh6pd37szfxszkg73zb6ffcvyw"))

(define rust-shlex-1.3.0
  (crate-source "shlex" "1.3.0"
                "0r1y6bv26c1scpxvhg2cabimrmwgbp4p3wy6syj9n0c4s3q2znhg"))

(define rust-shlex-2.0.1
  (crate-source "shlex" "2.0.1"
                "1fjsll1cd7d2bcpdij9kd6w62rpbc7qqzvydvs021vsmr1cxvypq"))

(define rust-signal-hook-0.3.18
  (crate-source "signal-hook" "0.3.18"
                "1qnnbq4g2vixfmlv28i1whkr0hikrf1bsc4xjy2aasj2yina30fq"))

(define rust-signal-hook-mio-0.2.5
  (crate-source "signal-hook-mio" "0.2.5"
                "1k20rr76ngvmzr6kskkl7dv8iyb84cbydpjbjk3mpcj0lykijnmp"))

(define rust-signal-hook-registry-1.4.6
  (crate-source "signal-hook-registry" "1.4.6"
                "12y2v1ms5z111fymaw1v8k93m5chnkp21h0jknrydkj8zydp395j"))

(define rust-signal-hook-registry-1.4.8
  (crate-source "signal-hook-registry" "1.4.8"
                "06vc7pmnki6lmxar3z31gkyg9cw7py5x9g7px70gy2hil75nkny4"))

(define rust-signature-2.2.0
  (crate-source "signature" "2.2.0"
                "1pi9hd5vqfr3q3k49k37z06p7gs5si0in32qia4mmr1dancr6m3p"))

(define rust-simd-adler32-0.3.10
  (crate-source "simd-adler32" "0.3.10"
                "1sny4y2qa5mwyxx5x59ln2p02vsdh92004njlslnx98imjc9489s"))

(define rust-simd-adler32-0.3.7
  (crate-source "simd-adler32" "0.3.7"
                "1zkq40c3iajcnr5936gjp9jjh1lpzhy44p3dq3fiw75iwr1w2vfn"))

(define rust-simd-adler32-0.3.8
  (crate-source "simd-adler32" "0.3.8"
                "18lx2gdgislabbvlgw5q3j5ssrr77v8kmkrxaanp3liimp2sc873"))

(define rust-simd-helpers-0.1.0
  (crate-source "simd_helpers" "0.1.0"
                "19idqicn9k4vhd04ifh2ff41wvna79zphdf2c81rlmpc7f3hz2cm"))

(define rust-siphasher-1.0.1
  (crate-source "siphasher" "1.0.1"
                "17f35782ma3fn6sh21c027kjmd227xyrx06ffi8gw4xzv9yry6an"))

(define rust-slab-0.4.11
  (crate-source "slab" "0.4.11"
                "12bm4s88rblq02jjbi1dw31984w61y2ldn13ifk5gsqgy97f8aks"))

(define rust-slab-0.4.12
  (crate-source "slab" "0.4.12"
                "1xcwik6s6zbd3lf51kkrcicdq2j4c1fw0yjdai2apy9467i0sy8c"))

(define rust-slotmap-1.1.1
  (crate-source "slotmap" "1.1.1"
                "0f20xf53zaysx9ydzkwwqm6hsjyb8lj2j6amhg57iln3jcy8rmdx"))

(define rust-smallvec-1.15.1
  (crate-source "smallvec" "1.15.1"
                "00xxdxxpgyq5vjnpljvkmy99xij5rxgh913ii1v16kzynnivgcb7"))

(define rust-smallvec-1.15.2
  (crate-source "smallvec" "1.15.2"
                "143wzbqf6vgapdp2z4qpl0yvlqcn17s8cnk8m28rqly808zsdmlf"))

(define rust-smawk-0.3.2
  (crate-source "smawk" "0.3.2"
                "0344z1la39incggwn6nl45k8cbw2x10mr5j0qz85cdz9np0qihxp"))

(define rust-socket2-0.6.0
  (crate-source "socket2" "0.6.0"
                "01qqdzfnr0bvdwq6wl56c9c4m2cvbxn43dfpcv8gjx208sph8d93"))

(define rust-socket2-0.6.1
  (crate-source "socket2" "0.6.1"
                "109qn0kjhqi5zds84qyqi5wn72g8azjhmf4b04fkgkrkd48rw4hp"))

(define rust-socket2-0.6.2
  (crate-source "socket2" "0.6.2"
                "1q073zkvz96h216mfz6niqk2kjqrgqv2va6zj34qh84zv4xamx46"))

(define rust-sorted-vec-0.8.11
  (crate-source "sorted-vec" "0.8.11"
                "0yswlqrbx5hadz9p13ix7lyvgqi9n0w7ijq307jys7w8vyz571i3"))

(define rust-sorted-vec-0.8.6
  (crate-source "sorted-vec" "0.8.6"
                "03bgrppmv4hr4pcfibpw4jqpikkxg18gbbmrwjs9lpqrnnf04wnk"))

(define rust-spin-0.9.8
  (crate-source "spin" "0.9.8"
                "0rvam5r0p3a6qhc18scqpvpgb3ckzyqxpgdfyjnghh8ja7byi039"))

(define rust-spinning-top-0.3.0
  (crate-source "spinning_top" "0.3.0"
                "001kjbiz1gg111rsqxc4pq9a1izx7wshkk38f69h1dbgf4fjsvfr"))

(define rust-spki-0.7.3
  (crate-source "spki" "0.7.3"
                "17fj8k5fmx4w9mp27l970clrh5qa7r5sjdvbsln987xhb34dc7nr"))

(define rust-ssh-agent-lib-0.5.1
  (crate-source "ssh-agent-lib" "0.5.1"
                "1fmbwz0qxds2w7rsvcg9kqm9x3wwifll8wxcc3g43k2mh357rxps"))

(define rust-ssh-cipher-0.2.0
  (crate-source "ssh-cipher" "0.2.0"
                "0kvq113x9fcy2jcxp00xk472zxm8d9zxxz2vyqx3rlzh88ki7b6a"))

(define rust-ssh-encoding-0.2.0
  (crate-source "ssh-encoding" "0.2.0"
                "05aavlhk68vm60vbw8lcgx1p5wry367ck8niij7af221xywl54pb"))

(define rust-ssh-key-0.6.7
  (crate-source "ssh-key" "0.6.7"
                "1hx8as8rvnk31ncqg7dlqgcw9bmngkznn3xamf6d010ggwlzb1iv"))

(define rust-stable-deref-trait-1.2.1
  (crate-source "stable_deref_trait" "1.2.1"
                "15h5h73ppqyhdhx6ywxfj88azmrpml9gl6zp3pwy2malqa6vxqkc"))

(define rust-static-assertions-1.1.0
  (crate-source "static_assertions" "1.1.0"
                "0gsl6xmw10gvn3zs1rv99laj5ig7ylffnh71f9l34js4nr4r7sx2"))

(define rust-stfu8-0.2.7
  (crate-source "stfu8" "0.2.7"
                "0y0rzzphh2mzfhjz0sxymnjn0s4ap21c74f469s9xycky24iw7z5"))

(define rust-strength-reduce-0.2.4
  (crate-source "strength_reduce" "0.2.4"
                "10jdq9dijjdkb20wg1dmwg447rnj37jbq0mwvbadvqi2gys5x2gy"))

(define rust-strsim-0.11.1
  (crate-source "strsim" "0.11.1"
                "0kzvqlw8hxqb7y598w1s0hxlnmi84sg5vsipp3yg5na5d1rvba3x"))

(define rust-strum-0.26.3
  (crate-source "strum" "0.26.3"
                "01lgl6jvrf4j28v5kmx9bp480ygf1nhvac8b4p7rcj9hxw50zv4g"))

(define rust-strum-0.27.1
  (crate-source "strum" "0.27.1"
                "0cic9r2sc2h17nnpjm2yfp7rsd35gkbcbqvrhl553jaiih4fykgn"))

(define rust-strum-0.27.2
  (crate-source "strum" "0.27.2"
                "1ksb9jssw4bg9kmv9nlgp2jqa4vnsa3y4q9zkppvl952q7vdc8xg"))

(define rust-strum-0.28.0
  (crate-source "strum" "0.28.0"
                "1ggr0if083c1mz9w33hkdjsp0iqk2fz9n49bvb73knwihydxwa4n"))

(define rust-strum-macros-0.26.4
  (crate-source "strum_macros" "0.26.4"
                "1gl1wmq24b8md527cpyd5bw9rkbqldd7k1h38kf5ajd2ln2ywssc"))

(define rust-strum-macros-0.27.1
  (crate-source "strum_macros" "0.27.1"
                "1s7x07nkrgjfvxrvcdjw6qanad4c55yjnd32bph9q3xgpid8qyn7"))

(define rust-strum-macros-0.27.2
  (crate-source "strum_macros" "0.27.2"
                "19xwikxma0yi70fxkcy1yxcv0ica8gf3jnh5gj936jza8lwcx5bn"))

(define rust-strum-macros-0.28.0
  (crate-source "strum_macros" "0.28.0"
                "0r7n6v5b3x85m52isyc8wq78irmr22g0hmj1xn3pbq8f4yhfx1db"))

(define rust-subtle-2.6.1
  (crate-source "subtle" "2.6.1"
                "14ijxaymghbl1p0wql9cib5zlwiina7kall6w7g89csprkgbvhhk"))

(define rust-supports-color-3.0.2
  (crate-source "supports-color" "3.0.2"
                "1mk7r2j6l7zmqk3pg7av0l6viq413lmk1vz4bjnf9lnq5liwfky6"))

(define rust-symphonia-0.5.5
  (crate-source "symphonia" "0.5.5"
                "0fbhlmvf1m9rb5xdy057vzymvirmzx39gx4hl3x9p7d1630a8wsp"))

(define rust-symphonia-bundle-flac-0.5.5
  (crate-source "symphonia-bundle-flac" "0.5.5"
                "0xlrdil9prgbwds8j2rd0z8gy9i5h13ca459h2dmv8mfh3hna5f9"))

(define rust-symphonia-bundle-mp3-0.5.5
  (crate-source "symphonia-bundle-mp3" "0.5.5"
                "1vapgi7haxmi4fnf09rvc4z6q24136m5gsg3k73ymxbbnmmxswj8"))

(define rust-symphonia-codec-vorbis-0.5.5
  (crate-source "symphonia-codec-vorbis" "0.5.5"
                "0wqwbnwb3ibwf14mx6irqm99bdap4950nxbjypz9zmlw61y869gh"))

(define rust-symphonia-core-0.5.5
  (crate-source "symphonia-core" "0.5.5"
                "1by293wrwb37as89fx8qzr1klvq6l5jw1pbyz1zvpxmpg57wq07a"))

(define rust-symphonia-format-ogg-0.5.5
  (crate-source "symphonia-format-ogg" "0.5.5"
                "1jrrar1v3a2x7gkm3c5j35mfzywphg5093a2x25amlqygk35aj9b"))

(define rust-symphonia-metadata-0.5.5
  (crate-source "symphonia-metadata" "0.5.5"
                "05kbkshrzqj83mlbkdwxkgkjzmhb3q99xm4rzid6xzlz5gs6yc1n"))

(define rust-symphonia-utils-xiph-0.5.5
  (crate-source "symphonia-utils-xiph" "0.5.5"
                "05lzmgxppqn647hmc1j9pgqsdqa2pxxcgvk8dd23i8wrnxdch9zf"))

(define rust-syn-2.0.104
  (crate-source "syn" "2.0.104"
                "0h2s8cxh5dsh9h41dxnlzpifqqn59cqgm0kljawws61ljq2zgdhp"))

(define rust-syn-2.0.106
  (crate-source "syn" "2.0.106"
                "19mddxp1ia00hfdzimygqmr1jqdvyl86k48427bkci4d08wc9rzd"))

(define rust-syn-2.0.111
  (crate-source "syn" "2.0.111"
                "11rf9l6435w525vhqmnngcnwsly7x4xx369fmaqvswdbjjicj31r"))

(define rust-syn-2.0.114
  (crate-source "syn" "2.0.114"
                "0akw62dizhyrkf3ym1jsys0gy1nphzgv0y8qkgpi6c1s4vghglfl"))

(define rust-syn-2.0.119
  (crate-source "syn" "2.0.119"
                "15vjy620l91a3q4n4f4gzhnflmdr6pnm38v2m6cpk86i8av32a47"))

(define rust-syn-3.0.2
  (crate-source "syn" "3.0.2"
                "18w7g5b9c585jw2rgvhygqdli8hq7w2jcds4h05lgz5plbbdc1x2"))

(define rust-sync-wrapper-1.0.2
  (crate-source "sync_wrapper" "1.0.2"
                "0qvjyasd6w18mjg5xlaq5jgy84jsjfsvmnn12c13gypxbv75dwhb"))

(define rust-synstructure-0.13.2
  (crate-source "synstructure" "0.13.2"
                "1lh9lx3r3jb18f8sbj29am5hm9jymvbwh6jb1izsnnxgvgrp12kj"))

(define rust-sysinfo-0.36.1
  (crate-source "sysinfo" "0.36.1"
                "0z9141y32amzlg87ky0swsi4myhwngcdpfmjnzzvkrv0a1s00a15"))

(define rust-sysinfo-0.37.2
  (crate-source "sysinfo" "0.37.2"
                "07xizvikp5j2f6jky0j4vlaxp21djznzja1m0z70f77xmxf7sq0n"))

(define rust-system-configuration-0.6.1
  (crate-source "system-configuration" "0.6.1"
                "0sxslml567zm0v8g732314vd2gk9sd3k4xj22xk6p64xir29v1rw"))

(define rust-system-configuration-sys-0.6.0
  ;; TODO: Check bundled sources.
  (crate-source "system-configuration-sys" "0.6.0"
                "1i5sqrmgy58l4704hibjbl36hclddglh73fb3wx95jnmrq81n7cf"))

(define rust-system-deps-6.2.2
  (crate-source "system-deps" "6.2.2"
                "0j93ryw031n3h8b0nfpj5xwh3ify636xmv8kxianvlyyipmkbrd3"))

(define rust-system-deps-7.0.7
  (crate-source "system-deps" "7.0.7"
                "0zsyh2m893nqkp1wri5c85favp2xyl1qpjxnd5nz31pr6qvz7j28"))

(define rust-tap-1.0.1
  (crate-source "tap" "1.0.1"
                "0sc3gl4nldqpvyhqi3bbd0l9k7fngrcl4zs47n314nqqk4bpx4sm"))

(define rust-tar-0.4.44
  (crate-source "tar" "0.4.44"
                "0yk69a8j9xv51mdcy0853jai5zh1pd9yn456q4cpmj0js9w3i1hx"))

(define rust-target-lexicon-0.12.16
  (crate-source "target-lexicon" "0.12.16"
                "1cg3bnx1gdkdr5hac1hzxy64fhw4g7dqkd0n3dxy5lfngpr1mi31"))

(define rust-target-lexicon-0.13.3
  (crate-source "target-lexicon" "0.13.3"
                "0355pbycq0cj29h1rp176l57qnfwmygv7hwzchs7iq15gibn4zyz"))

(define rust-tempfile-3.24.0
  (crate-source "tempfile" "3.24.0"
                "171fz3h6rj676miq15fyv1hnv69p426mlp8489bwa1b3xg3sjpb5"))

(define rust-terminal-size-0.4.3
  (crate-source "terminal_size" "0.4.3"
                "1l7cicmz49c0cyskfp5a389rsai649xi7y032v73475ikjbwpf30"))

(define rust-termtree-0.5.1
  (crate-source "termtree" "0.5.1"
                "10s610ax6nb70yi7xfmwcb6d3wi9sj5isd0m63gy2pizr2zgwl4g"))

(define rust-textwrap-0.16.2
  (crate-source "textwrap" "0.16.2"
                "0mrhd8q0dnh5hwbwhiv89c6i41yzmhw4clwa592rrp24b9hlfdf1"))

(define rust-thiserror-1.0.69
  (crate-source "thiserror" "1.0.69"
                "0lizjay08agcr5hs9yfzzj6axs53a2rgx070a1dsi3jpkcrzbamn"))

(define rust-thiserror-2.0.12
  (crate-source "thiserror" "2.0.12"
                "024791nsc0np63g2pq30cjf9acj38z3jwx9apvvi8qsqmqnqlysn"))

(define rust-thiserror-2.0.17
  (crate-source "thiserror" "2.0.17"
                "1j2gixhm2c3s6g96vd0b01v0i0qz1101vfmw0032mdqj1z58fdgn"))

(define rust-thiserror-2.0.18
  (crate-source "thiserror" "2.0.18"
                "1i7vcmw9900bvsmay7mww04ahahab7wmr8s925xc083rpjybb222"))

(define rust-thiserror-2.0.19
  (crate-source "thiserror" "2.0.19"
                "1ngwxsjsa64v1n7vb90h2b0i3fqk1piwaf0z6fqdacqfhjc3b909"))

(define rust-thiserror-impl-1.0.69
  (crate-source "thiserror-impl" "1.0.69"
                "1h84fmn2nai41cxbhk6pqf46bxqq1b344v8yz089w1chzi76rvjg"))

(define rust-thiserror-impl-2.0.12
  (crate-source "thiserror-impl" "2.0.12"
                "07bsn7shydaidvyyrm7jz29vp78vrxr9cr9044rfmn078lmz8z3z"))

(define rust-thiserror-impl-2.0.17
  (crate-source "thiserror-impl" "2.0.17"
                "04y92yjwg1a4piwk9nayzjfs07sps8c4vq9jnsfq9qvxrn75rw9z"))

(define rust-thiserror-impl-2.0.18
  (crate-source "thiserror-impl" "2.0.18"
                "1mf1vrbbimj1g6dvhdgzjmn6q09yflz2b92zs1j9n3k7cxzyxi7b"))

(define rust-thiserror-impl-2.0.19
  (crate-source "thiserror-impl" "2.0.19"
                "1ka10pqy1g8zy5al9m8yadg30jp8hx0q80j8awmd8131yw6gxjs3"))

(define rust-thousands-0.2.0
  (crate-source "thousands" "0.2.0"
                "0848gnkn7ah51lrx15z9zmn701ipn6gc4xbk4kfdlfahkypkpxiv"))

(define rust-thread-local-1.1.10
  (crate-source "thread_local" "1.1.10"
                "0w20g2pfdcp8pz3gds0bzksv6mxk802szca8qlr3701jdm69rn8s"))

(define rust-thread-local-1.1.9
  (crate-source "thread_local" "1.1.9"
                "1191jvl8d63agnq06pcnarivf63qzgpws5xa33hgc92gjjj4c0pn"))

(define rust-tiff-0.10.3
  (crate-source "tiff" "0.10.3"
                "0vrkdk9cdk07rh7iifcxpn6m8zv3wz695mizhr8rb3gfgzg0b5mg"))

(define rust-tiff-0.11.3
  (crate-source "tiff" "0.11.3"
                "0lmw68ic77sixk17r4rl2vsv00rqhja3yj2h9p5bcd9x6krylgxn"))

(define rust-tiff-0.9.1
  (crate-source "tiff" "0.9.1"
                "0ghyxlz566dzc3scvgmzys11dhq2ri77kb8sznjakijlxby104xs"))

(define rust-time-0.3.47
  (crate-source "time" "0.3.47"
                "0b7g9ly2iabrlgizliz6v5x23yq5d6bpp0mqz6407z1s526d8fvl"))

(define rust-time-core-0.1.8
  (crate-source "time-core" "0.1.8"
                "1jidl426mw48i7hjj4hs9vxgd9lwqq4vyalm4q8d7y4iwz7y353n"))

(define rust-time-macros-0.2.27
  (crate-source "time-macros" "0.2.27"
                "058ja265waq275wxvnfwavbz9r1hd4dgwpfn7a1a9a70l32y8w1f"))

(define rust-tinystr-0.8.2
  (crate-source "tinystr" "0.8.2"
                "0sa8z88axdsf088hgw5p4xcyi6g3w3sgbb6qdp81bph9bk2fkls2"))

(define rust-tinytemplate-1.2.1
  (crate-source "tinytemplate" "1.2.1"
                "1g5n77cqkdh9hy75zdb01adxn45mkh9y40wdr7l68xpz35gnnkdy"))

(define rust-tinyvec-1.10.0
  (crate-source "tinyvec" "1.10.0"
                "1yhk0qdqyiaa4v2j9h8pzax5gxgwpz4da0lcphfil6g6pk1zv9dz"))

(define rust-tinyvec-macros-0.1.1
  (crate-source "tinyvec_macros" "0.1.1"
                "081gag86208sc3y6sdkshgw3vysm5d34p431dzw0bshz66ncng0z"))

(define rust-tokio-1.47.1
  (crate-source "tokio" "1.47.1"
                "0f2hp5v3payg6x04ijj67si1wsdhksskhmjs2k9p5f7bmpyrmr49"))

(define rust-tokio-1.48.0
  (crate-source "tokio" "1.48.0"
                "0244qva5pksy8gam6llf7bd6wbk2vkab9lx26yyf08dix810wdpz"))

(define rust-tokio-1.49.0
  (crate-source "tokio" "1.49.0"
                "11ix3pl03s0bp71q3wddrbf8xr0cpn47d7fzr6m42r3kswy918kj"))

(define rust-tokio-macros-2.5.0
  (crate-source "tokio-macros" "2.5.0"
                "1f6az2xbvqp7am417b78d1za8axbvjvxnmkakz9vr8s52czx81kf"))

(define rust-tokio-macros-2.6.0
  (crate-source "tokio-macros" "2.6.0"
                "19czvgliginbzyhhfbmj77wazqn2y8g27y2nirfajdlm41bphh5g"))

(define rust-tokio-native-tls-0.3.1
  (crate-source "tokio-native-tls" "0.3.1"
                "1wkfg6zn85zckmv4im7mv20ca6b1vmlib5xwz9p7g19wjfmpdbmv"))

(define rust-tokio-pipe-0.2.12
  (crate-source "tokio-pipe" "0.2.12"
                "1117ahamrgc23qc6g22i1cflfpg3pfs498581gxbhqdxzx5sh4zj"))

(define rust-tokio-rustls-0.26.4
  (crate-source "tokio-rustls" "0.26.4"
                "0qggwknz9w4bbsv1z158hlnpkm97j3w8v31586jipn99byaala8p"))

(define rust-tokio-stream-0.1.17
  (crate-source "tokio-stream" "0.1.17"
                "0ix0770hfp4x5rh5bl7vsnr3d4iz4ms43i522xw70xaap9xqv9gc"))

(define rust-tokio-stream-0.1.18
  (crate-source "tokio-stream" "0.1.18"
                "0w3cj33605ab58wqd382gnla5pnd9hnr00xgg333np5bka04knij"))

(define rust-tokio-tungstenite-0.28.0
  (crate-source "tokio-tungstenite" "0.28.0"
                "0mzqgc94csy5ai6kx5yxj548shppq2kwdbyrsdsilhycvmn40nnj"))

(define rust-tokio-util-0.7.16
  (crate-source "tokio-util" "0.7.16"
                "1r9wdrg1k5hna3m0kc8kcb8jdb6n52g7vnw93kw2xxw4cyc7qc0l"))

(define rust-tokio-util-0.7.17
  (crate-source "tokio-util" "0.7.17"
                "152m2rp40bjphca5j581csczarvvr974zvwpzpldcwv0wygi9yif"))

(define rust-tokio-util-0.7.18
  (crate-source "tokio-util" "0.7.18"
                "1600rd47pylwn7cap1k7s5nvdaa9j7w8kqigzp1qy7mh0p4cxscs"))

(define rust-toml-0.5.11
  (crate-source "toml" "0.5.11"
                "0d2266nx8b3n22c7k24x4428z6di8n83a9n466jm7a2hipfz1xzl"))

(define rust-toml-0.8.23
  (crate-source "toml" "0.8.23"
                "0qnkrq4lm2sdhp3l6cb6f26i8zbnhqb7mhbmksd550wxdfcyn6yw"))

(define rust-toml-0.9.11+spec-1.1.0
  (crate-source "toml" "0.9.11+spec-1.1.0"
                "0ikwmd5s9ndg6afxijaxjcgxw53sd9af3mmfzymf37rh92lckbzk"))

(define rust-toml-0.9.2
  (crate-source "toml" "0.9.2"
                "1b0fcp0la720p82vcsv3lrkdgsz1lmhv02rfj2bi19rgq6bfw2pd"))

(define rust-toml-1.1.3+spec-1.1.0
  (crate-source "toml" "1.1.3+spec-1.1.0"
                "0g2c3lqf61ss14ak0lzg5r8fvsx8mnclzldfzk28y74lzb6nxjak"))

(define rust-toml-datetime-0.6.11
  (crate-source "toml_datetime" "0.6.11"
                "077ix2hb1dcya49hmi1avalwbixmrs75zgzb3b2i7g2gizwdmk92"))

(define rust-toml-datetime-0.7.0
  (crate-source "toml_datetime" "0.7.0"
                "1qwivxqkjxxwcqsvfhxnphpwphci0grdfk197wyxfn1gj0z1rpms"))

(define rust-toml-datetime-0.7.5+spec-1.1.0
  (crate-source "toml_datetime" "0.7.5+spec-1.1.0"
                "0iqkgvgsxmszpai53dbip7sf2igic39s4dby29dbqf1h9bnwzqcj"))

(define rust-toml-datetime-1.1.1+spec-1.1.0
  (crate-source "toml_datetime" "1.1.1+spec-1.1.0"
                "1mws2mkkf46l7inn77azhm0vdwxngv9vsbhbl0ah33p2c9gzcr9i"))

(define rust-toml-edit-0.22.27
  (crate-source "toml_edit" "0.22.27"
                "16l15xm40404asih8vyjvnka9g0xs9i4hfb6ry3ph9g419k8rzj1"))

(define rust-toml-edit-0.23.10+spec-1.0.0
  (crate-source "toml_edit" "0.23.10+spec-1.0.0"
                "0saj5c676j8a3sqaj9akkp09wambg8aflji4zblwwa70azvvkj44"))

(define rust-toml-parser-1.0.1
  (crate-source "toml_parser" "1.0.1"
                "0c6a77v4i8zll5dbpyr306iq02msjsr1fhd12b2p97h6vdr0a84p"))

(define rust-toml-parser-1.0.6+spec-1.1.0
  (crate-source "toml_parser" "1.0.6+spec-1.1.0"
                "0i5zxv5y3z9g6r3gm6ly4q0hhkahh013q4rys2fz04cf195qn6d3"))

(define rust-toml-parser-1.1.2+spec-1.1.0
  (crate-source "toml_parser" "1.1.2+spec-1.1.0"
                "09kmzc55a0j21whm290wlf5a8b18a0qc87a1s8sncrckc6wfkax2"))

(define rust-toml-writer-1.0.2
  (crate-source "toml_writer" "1.0.2"
                "0r7x3m050c66s9lssaq965vmrsxvxj131db4fq0m5vrd3w4l5j7w"))

(define rust-toml-writer-1.0.6+spec-1.1.0
  (crate-source "toml_writer" "1.0.6+spec-1.1.0"
                "01r6x42d1p8p5kzfsi1fm4dakm3w53vi69f2ivyqpvi1xm5g25mb"))

(define rust-toml-writer-1.1.2+spec-1.1.0
  (crate-source "toml_writer" "1.1.2+spec-1.1.0"
                "1lk6pqf9mac3v1x6282n6a66qx5b18c8f4a23bsd0nk658x3amkx"))

(define rust-totp-rs-5.7.0
  (crate-source "totp-rs" "5.7.0"
                "0wmz0ri3d9ml04wrd5qk5a6xq70g8zlzc2g9k61gi3pm10hka97i"))

(define rust-tower-0.5.2
  (crate-source "tower" "0.5.2"
                "1ybmd59nm4abl9bsvy6rx31m4zvzp5rja2slzpn712y9b68ssffh"))

(define rust-tower-0.5.3
  (crate-source "tower" "0.5.3"
                "1m5i3a2z1sgs8nnz1hgfq2nr4clpdmizlp1d9qsg358ma5iyzrgb"))

(define rust-tower-http-0.6.8
  (crate-source "tower-http" "0.6.8"
                "1y514jwzbyrmrkbaajpwmss4rg0mak82k16d6588w9ncaffmbrnl"))

(define rust-tower-layer-0.3.3
  (crate-source "tower-layer" "0.3.3"
                "03kq92fdzxin51w8iqix06dcfgydyvx7yr6izjq0p626v9n2l70j"))

(define rust-tower-service-0.3.3
  (crate-source "tower-service" "0.3.3"
                "1hzfkvkci33ra94xjx64vv3pp0sq346w06fpkcdwjcid7zhvdycd"))

(define rust-tracing-0.1.41
  (crate-source "tracing" "0.1.41"
                "1l5xrzyjfyayrwhvhldfnwdyligi1mpqm8mzbi2m1d6y6p2hlkkq"))

(define rust-tracing-0.1.44
  (crate-source "tracing" "0.1.44"
                "006ilqkg1lmfdh3xhg3z762izfwmxcvz0w7m4qx2qajbz9i1drv3"))

(define rust-tracing-attributes-0.1.30
  (crate-source "tracing-attributes" "0.1.30"
                "00v9bhfgfg3v101nmmy7s3vdwadb7ngc8c1iw6wai9vj9sv3lf41"))

(define rust-tracing-attributes-0.1.31
  (crate-source "tracing-attributes" "0.1.31"
                "1np8d77shfvz0n7camx2bsf1qw0zg331lra0hxb4cdwnxjjwz43l"))

(define rust-tracing-core-0.1.34
  (crate-source "tracing-core" "0.1.34"
                "0y3nc4mpnr79rzkrcylv5f5bnjjp19lsxwis9l4kzs97ya0jbldr"))

(define rust-tracing-core-0.1.36
  (crate-source "tracing-core" "0.1.36"
                "16mpbz6p8vd6j7sf925k9k8wzvm9vdfsjbynbmaxxyq6v7wwm5yv"))

(define rust-tracing-log-0.2.0
  (crate-source "tracing-log" "0.2.0"
                "1hs77z026k730ij1a9dhahzrl0s073gfa2hm5p0fbl0b80gmz1gf"))

(define rust-tracing-subscriber-0.3.19
  (crate-source "tracing-subscriber" "0.3.19"
                "0220rignck8072i89jjsh140vmh14ydwpdwnifyaf3xcnpn9s678"))

(define rust-tracing-subscriber-0.3.23
  (crate-source "tracing-subscriber" "0.3.23"
                "06fkr0qhggvrs861d7f74pn3i3a10h5jsp4n70jj9ys5b675fzyb"))

(define rust-trait-variant-0.1.2
  (crate-source "trait-variant" "0.1.2"
                "19vpbnbcsxdiznwdw854pd0vya7rm7v7hnl3nh741621603pg5vh"))

(define rust-transpose-0.2.3
  (crate-source "transpose" "0.2.3"
                "0zp74v7jrjg4jr654dncdj6hqvacicsywyhc62jawgxwhvnimmhs"))

(define rust-tree-magic-mini-3.2.0
  (crate-source "tree_magic_mini" "3.2.0"
                "0b2ncw376snr5lwdnmpqgnz4bm1j0c8xf11sq3pfipvci4fkjhzr"))

(define rust-try-lock-0.2.5
  (crate-source "try-lock" "0.2.5"
                "0jqijrrvm1pyq34zn1jmy2vihd4jcrjlvsh4alkjahhssjnsn8g4"))

(define rust-ttf-parser-0.25.1
  (crate-source "ttf-parser" "0.25.1"
                "0cbgqglcwwjg3hirwq6xlza54w04mb5x02kf7zx4hrw50xmr1pyj"))

(define rust-tui-bar-graph-0.3.1
  (crate-source "tui-bar-graph" "0.3.1"
                "0l0rb21pxd970z0sggfdk4282jzc3nkp4jvj4zvv1v9khsxmql4p"))

(define rust-tui-equalizer-0.2.0-alpha
  (crate-source "tui-equalizer" "0.2.0-alpha"
                "1l4fxc978d16gb9rx4xifrqvg7czdcm6zy2dfv0adil0vk4pb2ap"))

(define rust-tungstenite-0.28.0
  (crate-source "tungstenite" "0.28.0"
                "0hll4l62lk77zqzgps04689skpk555lcpmi3hhyyn2as9v4dqa46"))

(define rust-typenum-1.18.0
  (crate-source "typenum" "1.18.0"
                "0gwgz8n91pv40gabrr1lzji0b0hsmg0817njpy397bq7rvizzk0x"))

(define rust-typenum-1.19.0
  (crate-source "typenum" "1.19.0"
                "1fw2mpbn2vmqan56j1b3fbpcdg80mz26fm53fs16bq5xcq84hban"))

(define rust-typenum-1.20.1
  (crate-source "typenum" "1.20.1"
                "086s9ly0906kw5yw41249fba97w5zfxf03pyfwdkffvcprqfixdn"))

(define rust-uds-windows-1.1.0
  (crate-source "uds_windows" "1.1.0"
                "1fb4y65pw0rsp0gyfyinjazlzxz1f6zv7j4zmb20l5pxwv1ypnl9"))

(define rust-uncased-0.9.10
  (crate-source "uncased" "0.9.10"
                "15q6r6g4fszr8c2lzg9z9k9g52h8g29h24awda3d72cyw37qzf71"))

(define rust-unicode-bidi-0.3.18
  (crate-source "unicode-bidi" "0.3.18"
                "1xcxwbsqa24b8vfchhzyyzgj0l6bn51ib5v8j6krha0m77dva72w"))

(define rust-unicode-bidi-mirroring-0.4.0
  (crate-source "unicode-bidi-mirroring" "0.4.0"
                "1zirs1z3ahlwy7swg7apnm3pc6vix1g15q0kn6fx8rmvc266xyjx"))

(define rust-unicode-ccc-0.4.0
  (crate-source "unicode-ccc" "0.4.0"
                "0gjhxwx27ywm3rcbb0m5q20w8zxi51440b3ps6swi6ywpj4d8qff"))

(define rust-unicode-ident-1.0.18
  (crate-source "unicode-ident" "1.0.18"
                "04k5r6sijkafzljykdq26mhjpmhdx4jwzvn1lh90g9ax9903jpss"))

(define rust-unicode-ident-1.0.19
  (crate-source "unicode-ident" "1.0.19"
                "17bx1j1zf6b9j3kpyf74mraary7ava3984km0n8kh499h5a58fpn"))

(define rust-unicode-ident-1.0.22
  (crate-source "unicode-ident" "1.0.22"
                "1x8xrz17vqi6qmkkcqr8cyf0an76ig7390j9cnqnk47zyv2gf4lk"))

(define rust-unicode-ident-1.0.24
  (crate-source "unicode-ident" "1.0.24"
                "0xfs8y1g7syl2iykji8zk5hgfi5jw819f5zsrbaxmlzwsly33r76"))

(define rust-unicode-linebreak-0.1.5
  (crate-source "unicode-linebreak" "0.1.5"
                "07spj2hh3daajg335m4wdav6nfkl0f6c0q72lc37blr97hych29v"))

(define rust-unicode-properties-0.1.4
  (crate-source "unicode-properties" "0.1.4"
                "07fpm3sqq7lm9gmgpxa93z31q933h3c3ypfwy4cdh6l42g3miw3x"))

(define rust-unicode-script-0.5.8
  (crate-source "unicode-script" "0.5.8"
                "1vmifpgd0map3frmvhszhl96k82crcry083prv05wii7p45x8fiq"))

(define rust-unicode-segmentation-1.12.0
  (crate-source "unicode-segmentation" "1.12.0"
                "14qla2jfx74yyb9ds3d2mpwpa4l4lzb9z57c6d2ba511458z5k7n"))

(define rust-unicode-truncate-2.0.1
  (crate-source "unicode-truncate" "2.0.1"
                "19g9af5v0a8xaigqbs9hi9csxkg1fff07ycilvwfaqw64fhq1cqn"))

(define rust-unicode-width-0.2.2
  (crate-source "unicode-width" "0.2.2"
                "0m7jjzlcccw716dy9423xxh0clys8pfpllc5smvfxrzdf66h9b5l"))

(define rust-unsafe-libyaml-0.2.11
  (crate-source "unsafe-libyaml" "0.2.11"
                "0qdq69ffl3v5pzx9kzxbghzn0fzn266i1xn70y88maybz9csqfk7"))

(define rust-untrusted-0.9.0
  (crate-source "untrusted" "0.9.0"
                "1ha7ib98vkc538x0z60gfn0fc5whqdd85mb87dvisdcaifi6vjwf"))

(define rust-url-2.5.7
  (crate-source "url" "2.5.7"
                "0nzghdv0kcksyvri0npxbjzyx2ihprks5k590y77bld355m17g08"))

(define rust-url-2.5.8
  (crate-source "url" "2.5.8"
                "1v8f7nx3hpr1qh76if0a04sj08k86amsq4h8cvpw6wvk76jahrzz"))

(define rust-urlencoding-2.1.3
  (crate-source "urlencoding" "2.1.3"
                "1nj99jp37k47n0hvaz5fvz7z6jd0sb4ppvfy3nphr1zbnyixpy6s"))

(define rust-utf-8-0.7.6
  (crate-source "utf-8" "0.7.6"
                "1a9ns3fvgird0snjkd3wbdhwd3zdpc2h5gpyybrfr6ra5pkqxk09"))

(define rust-utf8-iter-1.0.4
  (crate-source "utf8_iter" "1.0.4"
                "1gmna9flnj8dbyd8ba17zigrp9c4c3zclngf5lnb5yvz1ri41hdn"))

(define rust-utf8parse-0.2.2
  (crate-source "utf8parse" "0.2.2"
                "088807qwjq46azicqwbhlmzwrbkz7l4hpw43sdkdyyk524vdxaq6"))

(define rust-uuid-0.8.2
  (crate-source "uuid" "0.8.2"
                "1dy4ldcp7rnzjy56dxh7d2sgrcvn4q77y0a8r0a48946h66zjp5w"))

(define rust-uuid-1.19.0
  (crate-source "uuid" "1.19.0"
                "0jjbclx3f36fjl6jjh8f022q0m76v3cfh61y6z6jgl2b3f359q72"))

(define rust-v-frame-0.3.9
  (crate-source "v_frame" "0.3.9"
                "1qkvb4ks33zck931vzqckjn36hkngj6l2cwmvfsnlpc7r0kpfsv6"))

(define rust-valuable-0.1.1
  (crate-source "valuable" "0.1.1"
                "0r9srp55v7g27s5bg7a2m095fzckrcdca5maih6dy9bay6fflwxs"))

(define rust-vcpkg-0.2.15
  (crate-source "vcpkg" "0.2.15"
                "09i4nf5y8lig6xgj3f7fyrvzd3nlaw4znrihw8psidvv5yk4xkdc"))

(define rust-vergen-9.0.6
  (crate-source "vergen" "9.0.6"
                "0xs7drxw7jlklnyrc8mifkpvag8nckja5ly60i0l3j8zw65zaavb"))

(define rust-vergen-gitcl-1.0.8
  (crate-source "vergen-gitcl" "1.0.8"
                "1zmffxim0560czbfd5gaq3nqnqr9jlbinbqmvx6qmq5jdvgc3pxr"))

(define rust-vergen-lib-0.1.6
  (crate-source "vergen-lib" "0.1.6"
                "0rn1x40xwx4zlj62nkl63y6sczar6hw1dq34n7y5jghg1h0yc1wv"))

(define rust-vergen-lib-9.1.0
  (crate-source "vergen-lib" "9.1.0"
                "0sd5b5d5ygwi86k1b4n9vipqmyxqn4pr7qcs48pycncwgsx2jjmk"))

(define rust-version-check-0.9.5
  (crate-source "version_check" "0.9.5"
                "0nhhi4i5x89gm911azqbn7avs9mdacw2i3vcz3cnmz3mv4rqz4hb"))

(define rust-version-compare-0.1.1
  (crate-source "version-compare" "0.1.1"
                "0acg4pmjdbmclg0m7yhijn979mdy66z3k8qrcnvn634f1gy456jp"))

(define rust-version-compare-0.2.0
  (crate-source "version-compare" "0.2.0"
                "12y9262fhjm1wp0aj3mwhads7kv0jz8h168nn5fb8b43nwf9abl5"))

(define rust-version-compare-0.2.1
  (crate-source "version-compare" "0.2.1"
                "03nziqxwnxlizl42cwsx33vi5xd2cf2jnszhh9rzay7g6xl8bhh3"))

(define rust-wait-timeout-0.2.1
  (crate-source "wait-timeout" "0.2.1"
                "04azqv9mnfxgvnc8j2wp362xraybakh2dy1nj22gj51rdl93pb09"))

(define rust-walkdir-2.5.0
  (crate-source "walkdir" "2.5.0"
                "0jsy7a710qv8gld5957ybrnc07gavppp963gs32xk4ag8130jy99"))

(define rust-want-0.3.1
  (crate-source "want" "0.3.1"
                "03hbfrnvqqdchb5kgxyavb9jabwza0dmh2vw5kg0dq8rxl57d9xz"))

(define rust-wasi-0.11.1+wasi-snapshot-preview1
  (crate-source "wasi" "0.11.1+wasi-snapshot-preview1"
                "0jx49r7nbkbhyfrfyhz0bm4817yrnxgd3jiwwwfv0zl439jyrwyc"))

(define rust-wasi-0.14.2+wasi-0.2.4
  (crate-source "wasi" "0.14.2+wasi-0.2.4"
                "1cwcqjr3dgdq8j325awgk8a715h0hg0f7jqzsb077n4qm6jzk0wn"))

(define rust-wasip2-1.0.1+wasi-0.2.4
  (crate-source "wasip2" "1.0.1+wasi-0.2.4"
                "1rsqmpspwy0zja82xx7kbkbg9fv34a4a2if3sbd76dy64a244qh5"))

(define rust-wasip2-1.0.2+wasi-0.2.9
  (crate-source "wasip2" "1.0.2+wasi-0.2.9"
                "1xdw7v08jpfjdg94sp4lbdgzwa587m5ifpz6fpdnkh02kwizj5wm"))

(define rust-wasip2-1.0.4+wasi-0.2.12
  (crate-source "wasip2" "1.0.4+wasi-0.2.12"
                "11wl7lqwq4pbmlmzr6n7bwz0hzy1z6sxc4554bkmrr86w4vznzmn"))

(define rust-wasm-bindgen-0.2.100
  (crate-source "wasm-bindgen" "0.2.100"
                "1x8ymcm6yi3i1rwj78myl1agqv2m86i648myy3lc97s9swlqkp0y"))

(define rust-wasm-bindgen-0.2.103
  (crate-source "wasm-bindgen" "0.2.103"
                "069qhf7yrl4jymzjzvwsmcmw96al639xim4scigpy5qapngsc45b"))

(define rust-wasm-bindgen-0.2.106
  (crate-source "wasm-bindgen" "0.2.106"
                "1zc0pcyv0w1dhp8r7ybmmfjsf4g18q784h0k7mv2sjm67x1ryx8d"))

(define rust-wasm-bindgen-0.2.108
  (crate-source "wasm-bindgen" "0.2.108"
                "0rl5pn80sdhj2p2r28lp3k50a8mpppzgwzssz2f3jdqyxhq4l0k4"))

(define rust-wasm-bindgen-0.2.126
  (crate-source "wasm-bindgen" "0.2.126"
                "197rma4qg1kb8l4bl7857pgszzval8s1w740g9myyjh92467q1jb"))

(define rust-wasm-bindgen-backend-0.2.100
  (crate-source "wasm-bindgen-backend" "0.2.100"
                "1ihbf1hq3y81c4md9lyh6lcwbx6a5j0fw4fygd423g62lm8hc2ig"))

(define rust-wasm-bindgen-backend-0.2.103
  (crate-source "wasm-bindgen-backend" "0.2.103"
                "070x7fjnnvzm2y3a5j29wmss4z547cjdx3rnpixh19j56m105dqb"))

(define rust-wasm-bindgen-futures-0.4.56
  (crate-source "wasm-bindgen-futures" "0.4.56"
                "0z6f0zkylpgbfb7dkh7a85dxdwm57q7c2np2bngfxzh4sqi9cvc3"))

(define rust-wasm-bindgen-futures-0.4.58
  (crate-source "wasm-bindgen-futures" "0.4.58"
                "0vqywn9df5i6mms3sw47v3kj7rzx8ryghqq0xb4jk05fs1zyg9kh"))

(define rust-wasm-bindgen-macro-0.2.100
  (crate-source "wasm-bindgen-macro" "0.2.100"
                "01xls2dvzh38yj17jgrbiib1d3nyad7k2yw9s0mpklwys333zrkz"))

(define rust-wasm-bindgen-macro-0.2.103
  (crate-source "wasm-bindgen-macro" "0.2.103"
                "18481jkmczv4j0m747ypb0k1acq093hhbdhpb4sr856r27sg8rgw"))

(define rust-wasm-bindgen-macro-0.2.106
  (crate-source "wasm-bindgen-macro" "0.2.106"
                "1czfwzhqrkzyyhd3g58mdwb2jjk4q2pl9m1fajyfvfpq70k0vjs8"))

(define rust-wasm-bindgen-macro-0.2.108
  (crate-source "wasm-bindgen-macro" "0.2.108"
                "026nnvakp0w6j3ghpcxn31shj9wx8bv8x7nk3gkk40klkjfj72q0"))

(define rust-wasm-bindgen-macro-0.2.126
  (crate-source "wasm-bindgen-macro" "0.2.126"
                "1cda6wl5zyiy7777cfgrix7fhpaqba55l5zpqj4zig7ng7jyaz0n"))

(define rust-wasm-bindgen-macro-support-0.2.100
  (crate-source "wasm-bindgen-macro-support" "0.2.100"
                "1plm8dh20jg2id0320pbmrlsv6cazfv6b6907z19ys4z1jj7xs4a"))

(define rust-wasm-bindgen-macro-support-0.2.103
  (crate-source "wasm-bindgen-macro-support" "0.2.103"
                "0clsx611pday95s6wg8pndvrd8xknsaf20d40kk8x2irj6lh7h7z"))

(define rust-wasm-bindgen-macro-support-0.2.106
  (crate-source "wasm-bindgen-macro-support" "0.2.106"
                "0h6ddq6cc6jf9phsdh2a3x8lpjhmkya86ihfz3fdk4jzrpamkyyf"))

(define rust-wasm-bindgen-macro-support-0.2.108
  (crate-source "wasm-bindgen-macro-support" "0.2.108"
                "0m9sj475ypgifbkvksjsqs2gy3bq96f87ychch784m4gspiblmjj"))

(define rust-wasm-bindgen-macro-support-0.2.126
  (crate-source "wasm-bindgen-macro-support" "0.2.126"
                "03iq412frl2py55skwb3ya08xha0cf6q22zr5kqlwbr675w7r6gk"))

(define rust-wasm-bindgen-shared-0.2.100
  (crate-source "wasm-bindgen-shared" "0.2.100"
                "0gffxvqgbh9r9xl36gprkfnh3w9gl8wgia6xrin7v11sjcxxf18s"))

(define rust-wasm-bindgen-shared-0.2.103
  (crate-source "wasm-bindgen-shared" "0.2.103"
                "1kx13fvmlxxaxf04vm3b14437hyq92zdy89pvcaclc54xzs3fg19"))

(define rust-wasm-bindgen-shared-0.2.106
  (crate-source "wasm-bindgen-shared" "0.2.106"
                "1d0dh3jn77qz67n5zh0s3rvzlbjv926p0blq5bvng2v4gq2kiifb"))

(define rust-wasm-bindgen-shared-0.2.108
  (crate-source "wasm-bindgen-shared" "0.2.108"
                "04ix7v99rvj5730553j58pqsrwpf9sqazr60y3cchx5cr60ba08z"))

(define rust-wasm-bindgen-shared-0.2.126
  (crate-source "wasm-bindgen-shared" "0.2.126"
                "097a3kbjls447s1lwr41l21x5crrh5vq3h6zsxccz7slrjq4q6yw"))

(define rust-wayland-backend-0.3.11
  (crate-source "wayland-backend" "0.3.11"
                "0dcvwkhz45gsm7f9dwr31pxijkhpza09a4vb3blsv9a8631k6fk7"))

(define rust-wayland-backend-0.3.12
  (crate-source "wayland-backend" "0.3.12"
                "1yb4s5mbcis3z3gcmxq2lzgrcw2li7jsfr9ayi4gcsyrrja43rpy"))

(define rust-wayland-client-0.31.11
  (crate-source "wayland-client" "0.31.11"
                "17a4vl5qw4jnnh2azm0d3kcpajyb9qz4psv448zpj86w83l4fsn6"))

(define rust-wayland-client-0.31.12
  (crate-source "wayland-client" "0.31.12"
                "1v1b2b2s0ld41psn3v2p3c6i590iz3r427czrf3c3dpv6yjzmrmq"))

(define rust-wayland-protocols-0.31.2
  (crate-source "wayland-protocols" "0.31.2"
                "1x310l1p6p3p3l76nl1l2yava9408dy77s605917zadlp1jz70cg"))

(define rust-wayland-protocols-0.32.9
  (crate-source "wayland-protocols" "0.32.9"
                "00cripl4m7hzhl0gzp4bqayal8n0zlf1llnj7cl73zgvfpnr19zg"))

(define rust-wayland-protocols-wlr-0.2.0
  (crate-source "wayland-protocols-wlr" "0.2.0"
                "1mjww9psk2nc5hm2q4s3qas30rbzfg1sb6qgw518fbbcdfvn27xd"))

(define rust-wayland-protocols-wlr-0.3.9
  (crate-source "wayland-protocols-wlr" "0.3.9"
                "1v3qbg18vsb3i62c6042xhjm7dcflmylzjlhl0w9kks3xmilkngg"))

(define rust-wayland-scanner-0.31.7
  (crate-source "wayland-scanner" "0.31.7"
                "1qqalp551blcxjzx80zvs7ckc19k966892zxpm81kacxqjfixjsl"))

(define rust-wayland-scanner-0.31.8
  (crate-source "wayland-scanner" "0.31.8"
                "1qw971z9jcxdw8s371gx2anmwb95m59y38q3k11qxrk3d95yj8sl"))

(define rust-wayland-server-0.31.11
  (crate-source "wayland-server" "0.31.11"
                "1j8qn606nabs6xg4hd41kfjyr4123ddmqi9n3mqrgxfiz28ap5wj"))

(define rust-wayland-sys-0.31.7
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "wayland-sys" "0.31.7"
                "0hk157yawv9y7aj7fxbldhlvv8p33c65v3nv85mq4m91h919p51l"))

(define rust-wayland-sys-0.31.8
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "wayland-sys" "0.31.8"
                "1zdxrcl8paklwir0lag1i80k6h0iq1f80d925b4p9yaymk1vyv8y"))

(define rust-wayrs-client-1.3.1
  (crate-source "wayrs-client" "1.3.1"
                "0zpwyz4gk1dji2invr4kxdynzaxxfznbnw51j6rxibbj4ja4cynf"))

(define rust-wayrs-core-1.0.5
  (crate-source "wayrs-core" "1.0.5"
                "0pb7srfclfcg0y684kgl3qlryw9nwkkpshsm1jfk0ca9v2dlypq1"))

(define rust-wayrs-proto-parser-3.0.1
  (crate-source "wayrs-proto-parser" "3.0.1"
                "0g74n84xhvjjbhz158lb5fqx9lyynh5yawxvkf6mzlca7l1rqrs1"))

(define rust-wayrs-protocols-0.14.11+1.45
  (crate-source "wayrs-protocols" "0.14.11+1.45"
                "111872hzqxya9lb2akk756x9p62p9fsn8n7fqs7ldbdws9hbrrr8"))

(define rust-wayrs-scanner-0.15.4
  (crate-source "wayrs-scanner" "0.15.4"
                "0a4d6szwgj6shm674n550b6nlf7va6z46i7idb5cpmx8c32zgchn"))

(define rust-web-sys-0.3.83
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "web-sys" "0.3.83"
                "1b1pw450ig62xr0cy1wfjlbahvmi725jl64d150j0hacfy6q4clv"))

(define rust-web-sys-0.3.85
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "web-sys" "0.3.85"
                "1645c202gyw21m6kxw4ya81vrapl40hlb8m9iqhjj8fra7jk4bii"))

(define rust-web-time-1.1.0
  (crate-source "web-time" "1.1.0"
                "1fx05yqx83dhx628wb70fyy10yjfq1jpl20qfqhdkymi13rq0ras"))

(define rust-webbrowser-1.0.6
  (crate-source "webbrowser" "1.0.6"
                "15sc38k0j8ssgr4li6bgavmad8r46h4rc0zs68x3w8c5ywz29w80"))

(define rust-webpki-roots-1.0.5
  (crate-source "webpki-roots" "1.0.5"
                "0b3j9ngc8fca3kg24f4jb4v9969vmdngv6s2i4wccxijhs0ddghj"))

(define rust-weezl-0.1.10
  (crate-source "weezl" "0.1.10"
                "1wqnxqn8n90bgazs6djlibf58ppdxki4slblwp9lgnq0fwkv6ld7"))

(define rust-weezl-0.1.12
  (crate-source "weezl" "0.1.12"
                "122a1dhha6cib5az4ihcqlh60ns2bi6rskdv875p94lbvj6wk2m2"))

(define rust-which-4.4.2
  (crate-source "which" "4.4.2"
                "1ixzmx3svsv5hbdvd8vdhd3qwvf6ns8jdpif1wmwsy10k90j9fl7"))

(define rust-wide-0.7.33
  (crate-source "wide" "0.7.33"
                "00yd2sg83xvfrjjlwndyk49fjx8jlmlrz8byigndig32rf7dmr8c"))

(define rust-winapi-0.3.9
  (crate-source "winapi" "0.3.9"
                "06gl025x418lchw1wxj64ycr7gha83m44cjr5sarhynd9xkrm0sw"))

(define rust-winapi-i686-pc-windows-gnu-0.4.0
  (crate-source "winapi-i686-pc-windows-gnu" "0.4.0"
                "1dmpa6mvcvzz16zg6d5vrfy4bxgg541wxrcip7cnshi06v38ffxc"))

(define rust-winapi-util-0.1.11
  (crate-source "winapi-util" "0.1.11"
                "08hdl7mkll7pz8whg869h58c1r9y7in0w0pk8fm24qc77k0b39y2"))

(define rust-winapi-x86-64-pc-windows-gnu-0.4.0
  (crate-source "winapi-x86_64-pc-windows-gnu" "0.4.0"
                "0gqq64czqb64kskjryj8isp62m2sgvx25yyj3kpc2myh85w24bki"))

(define rust-windows-0.54.0
  (crate-source "windows" "0.54.0"
                "0j8vd8sg2rbln6g3a608qg1a7r2lwxcga78mmxjjin5ybmrfallj"))

(define rust-windows-0.61.3
  (crate-source "windows" "0.61.3"
                "14v8dln7i4ccskd8danzri22bkjkbmgzh284j3vaxhd4cykx7awv"))

(define rust-windows-0.62.2
  (crate-source "windows" "0.62.2"
                "10457l9ihrbw8j79z2v4plyjxkf6xvb5npd0lqwmkh702gpaszsj"))

(define rust-windows-aarch64-gnullvm-0.42.2
  (crate-source "windows_aarch64_gnullvm" "0.42.2"
                "1y4q0qmvl0lvp7syxvfykafvmwal5hrjb4fmv04bqs0bawc52yjr"))

(define rust-windows-aarch64-gnullvm-0.52.6
  (crate-source "windows_aarch64_gnullvm" "0.52.6"
                "1lrcq38cr2arvmz19v32qaggvj8bh1640mdm9c2fr877h0hn591j"))

(define rust-windows-aarch64-gnullvm-0.53.0
  (crate-source "windows_aarch64_gnullvm" "0.53.0"
                "0r77pbpbcf8bq4yfwpz2hpq3vns8m0yacpvs2i5cn6fx1pwxbf46"))

(define rust-windows-aarch64-gnullvm-0.53.1
  (crate-source "windows_aarch64_gnullvm" "0.53.1"
                "0lqvdm510mka9w26vmga7hbkmrw9glzc90l4gya5qbxlm1pl3n59"))

(define rust-windows-aarch64-msvc-0.42.2
  (crate-source "windows_aarch64_msvc" "0.42.2"
                "0hsdikjl5sa1fva5qskpwlxzpc5q9l909fpl1w6yy1hglrj8i3p0"))

(define rust-windows-aarch64-msvc-0.52.6
  (crate-source "windows_aarch64_msvc" "0.52.6"
                "0sfl0nysnz32yyfh773hpi49b1q700ah6y7sacmjbqjjn5xjmv09"))

(define rust-windows-aarch64-msvc-0.53.0
  (crate-source "windows_aarch64_msvc" "0.53.0"
                "0v766yqw51pzxxwp203yqy39ijgjamp54hhdbsyqq6x1c8gilrf7"))

(define rust-windows-aarch64-msvc-0.53.1
  (crate-source "windows_aarch64_msvc" "0.53.1"
                "01jh2adlwx043rji888b22whx4bm8alrk3khjpik5xn20kl85mxr"))

(define rust-windows-collections-0.2.0
  (crate-source "windows-collections" "0.2.0"
                "1s65anr609qvsjga7w971p6iq964h87670dkfqfypnfgwnswxviv"))

(define rust-windows-collections-0.3.2
  (crate-source "windows-collections" "0.3.2"
                "0436rjbkqn3j9m2v2lcmwwk0l3n2r57yvqb7fcy4m8d8y5ddkci3"))

(define rust-windows-core-0.54.0
  (crate-source "windows-core" "0.54.0"
                "0r8x2sgl4qq1h23ldf4z7cj213k0bz7479m8a156h79mi6f1nrhj"))

(define rust-windows-core-0.61.2
  (crate-source "windows-core" "0.61.2"
                "1qsa3iw14wk4ngfl7ipcvdf9xyq456ms7cx2i9iwf406p7fx7zf0"))

(define rust-windows-core-0.62.0
  (crate-source "windows-core" "0.62.0"
                "0z294cblga0dl2dg9s9080xyglkh33b7zc05i8nqsmyyyxl73zjp"))

(define rust-windows-core-0.62.2
  (crate-source "windows-core" "0.62.2"
                "1swxpv1a8qvn3bkxv8cn663238h2jccq35ff3nsj61jdsca3ms5q"))

(define rust-windows-future-0.2.1
  (crate-source "windows-future" "0.2.1"
                "13mdzcdn51ckpzp3frb8glnmkyjr1c30ym9wnzj9zc97hkll2spw"))

(define rust-windows-future-0.3.2
  (crate-source "windows-future" "0.3.2"
                "1jq5qs2dwzf6rl60f8gr49z2mifxsrdh4y4yfdws467ya41gkmp1"))

(define rust-windows-i686-gnu-0.42.2
  (crate-source "windows_i686_gnu" "0.42.2"
                "0kx866dfrby88lqs9v1vgmrkk1z6af9lhaghh5maj7d4imyr47f6"))

(define rust-windows-i686-gnu-0.52.6
  (crate-source "windows_i686_gnu" "0.52.6"
                "02zspglbykh1jh9pi7gn8g1f97jh1rrccni9ivmrfbl0mgamm6wf"))

(define rust-windows-i686-gnu-0.53.0
  (crate-source "windows_i686_gnu" "0.53.0"
                "1hvjc8nv95sx5vdd79fivn8bpm7i517dqyf4yvsqgwrmkmjngp61"))

(define rust-windows-i686-gnu-0.53.1
  (crate-source "windows_i686_gnu" "0.53.1"
                "18wkcm82ldyg4figcsidzwbg1pqd49jpm98crfz0j7nqd6h6s3ln"))

(define rust-windows-i686-gnullvm-0.52.6
  (crate-source "windows_i686_gnullvm" "0.52.6"
                "0rpdx1537mw6slcpqa0rm3qixmsb79nbhqy5fsm3q2q9ik9m5vhf"))

(define rust-windows-i686-gnullvm-0.53.0
  (crate-source "windows_i686_gnullvm" "0.53.0"
                "04df1in2k91qyf1wzizvh560bvyzq20yf68k8xa66vdzxnywrrlw"))

(define rust-windows-i686-gnullvm-0.53.1
  (crate-source "windows_i686_gnullvm" "0.53.1"
                "030qaxqc4salz6l4immfb6sykc6gmhyir9wzn2w8mxj8038mjwzs"))

(define rust-windows-i686-msvc-0.42.2
  (crate-source "windows_i686_msvc" "0.42.2"
                "0q0h9m2aq1pygc199pa5jgc952qhcnf0zn688454i7v4xjv41n24"))

(define rust-windows-i686-msvc-0.52.6
  (crate-source "windows_i686_msvc" "0.52.6"
                "0rkcqmp4zzmfvrrrx01260q3xkpzi6fzi2x2pgdcdry50ny4h294"))

(define rust-windows-i686-msvc-0.53.0
  (crate-source "windows_i686_msvc" "0.53.0"
                "0pcvb25fkvqnp91z25qr5x61wyya12lx8p7nsa137cbb82ayw7sq"))

(define rust-windows-i686-msvc-0.53.1
  (crate-source "windows_i686_msvc" "0.53.1"
                "1hi6scw3mn2pbdl30ji5i4y8vvspb9b66l98kkz350pig58wfyhy"))

(define rust-windows-implement-0.60.0
  (crate-source "windows-implement" "0.60.0"
                "0dm88k3hlaax85xkls4gf597ar4z8m5vzjjagzk910ph7b8xszx4"))

(define rust-windows-implement-0.60.2
  (crate-source "windows-implement" "0.60.2"
                "1psxhmklzcf3wjs4b8qb42qb6znvc142cb5pa74rsyxm1822wgh5"))

(define rust-windows-interface-0.59.1
  (crate-source "windows-interface" "0.59.1"
                "1a4zr8740gyzzhq02xgl6vx8l669jwfby57xgf0zmkcdkyv134mx"))

(define rust-windows-interface-0.59.3
  (crate-source "windows-interface" "0.59.3"
                "0n73cwrn4247d0axrk7gjp08p34x1723483jxjxjdfkh4m56qc9z"))

(define rust-windows-link-0.1.3
  (crate-source "windows-link" "0.1.3"
                "12kr1p46dbhpijr4zbwr2spfgq8i8c5x55mvvfmyl96m01cx4sjy"))

(define rust-windows-link-0.2.0
  (crate-source "windows-link" "0.2.0"
                "0r9w2z96d5phmm185aq92z54jp9h2nqisa4wgc71idxbc436rr25"))

(define rust-windows-link-0.2.1
  (crate-source "windows-link" "0.2.1"
                "1rag186yfr3xx7piv5rg8b6im2dwcf8zldiflvb22xbzwli5507h"))

(define rust-windows-numerics-0.2.0
  (crate-source "windows-numerics" "0.2.0"
                "1cf2j8nbqf0hqqa7chnyid91wxsl2m131kn0vl3mqk3c0rlayl4i"))

(define rust-windows-numerics-0.3.1
  (crate-source "windows-numerics" "0.3.1"
                "09hgbg8pf89r4090yyhh9q29ppi7yyxkgmga9ascshy19a240bkf"))

(define rust-windows-registry-0.6.1
  (crate-source "windows-registry" "0.6.1"
                "082p7l615qk8a4g8g15yipc5lghga6cgfhm74wm7zknwzgvjnx82"))

(define rust-windows-result-0.1.2
  (crate-source "windows-result" "0.1.2"
                "1y274q1v0vy21lhkgslpxpq1m08hvr1mcs2l88h1b1gcx0136f2y"))

(define rust-windows-result-0.3.4
  (crate-source "windows-result" "0.3.4"
                "1il60l6idrc6hqsij0cal0mgva6n3w6gq4ziban8wv6c6b9jpx2n"))

(define rust-windows-result-0.4.0
  (crate-source "windows-result" "0.4.0"
                "0zqn8kmmf7y9yw9g7q6pbcg9dbry9m03fqi0b92q767q0v1xr13h"))

(define rust-windows-result-0.4.1
  (crate-source "windows-result" "0.4.1"
                "1d9yhmrmmfqh56zlj751s5wfm9a2aa7az9rd7nn5027nxa4zm0bp"))

(define rust-windows-strings-0.4.2
  (crate-source "windows-strings" "0.4.2"
                "0mrv3plibkla4v5kaakc2rfksdd0b14plcmidhbkcfqc78zwkrjn"))

(define rust-windows-strings-0.5.0
  (crate-source "windows-strings" "0.5.0"
                "1nld65azvms87rdm2bdm8gskwdmsswh4pxbc8babxc2klmawc63j"))

(define rust-windows-strings-0.5.1
  (crate-source "windows-strings" "0.5.1"
                "14bhng9jqv4fyl7lqjz3az7vzh8pw0w4am49fsqgcz67d67x0dvq"))

(define rust-windows-sys-0.45.0
  ;; TODO: Check bundled sources.
  (crate-source "windows-sys" "0.45.0"
                "1l36bcqm4g89pknfp8r9rl1w4bn017q6a8qlx8viv0xjxzjkna3m"))

(define rust-windows-sys-0.52.0
  ;; TODO: Check bundled sources.
  (crate-source "windows-sys" "0.52.0"
                "0gd3v4ji88490zgb6b5mq5zgbvwv7zx1ibn8v3x83rwcdbryaar8"))

(define rust-windows-sys-0.59.0
  ;; TODO: Check bundled sources.
  (crate-source "windows-sys" "0.59.0"
                "0fw5672ziw8b3zpmnbp9pdv1famk74f1l9fcbc3zsrzdg56vqf0y"))

(define rust-windows-sys-0.60.2
  ;; TODO: Check bundled sources.
  (crate-source "windows-sys" "0.60.2"
                "1jrbc615ihqnhjhxplr2kw7rasrskv9wj3lr80hgfd42sbj01xgj"))

(define rust-windows-sys-0.61.2
  ;; TODO: Check bundled sources.
  (crate-source "windows-sys" "0.61.2"
                "1z7k3y9b6b5h52kid57lvmvm05362zv1v8w0gc7xyv5xphlp44xf"))

(define rust-windows-targets-0.42.2
  (crate-source "windows-targets" "0.42.2"
                "0wfhnib2fisxlx8c507dbmh97kgij4r6kcxdi0f9nk6l1k080lcf"))

(define rust-windows-targets-0.52.6
  (crate-source "windows-targets" "0.52.6"
                "0wwrx625nwlfp7k93r2rra568gad1mwd888h1jwnl0vfg5r4ywlv"))

(define rust-windows-targets-0.53.2
  (crate-source "windows-targets" "0.53.2"
                "1vwanhx2br7dh8mmrszdbcf01bccjr01mcyxcscxl4ffr7y6jvy6"))

(define rust-windows-targets-0.53.3
  (crate-source "windows-targets" "0.53.3"
                "14fwwm136dhs3i1impqrrip7nvkra3bdxa4nqkblj604qhqn1znm"))

(define rust-windows-targets-0.53.5
  (crate-source "windows-targets" "0.53.5"
                "1wv9j2gv3l6wj3gkw5j1kr6ymb5q6dfc42yvydjhv3mqa7szjia9"))

(define rust-windows-threading-0.1.0
  (crate-source "windows-threading" "0.1.0"
                "19jpn37zpjj2q7pn07dpq0ay300w65qx7wdp13wbp8qf5snn6r5n"))

(define rust-windows-threading-0.2.1
  (crate-source "windows-threading" "0.2.1"
                "0dsvsy33vxs0153z4n39sqkzx382cjjkrd46rb3z3zfak5dvsj9r"))

(define rust-windows-x86-64-gnu-0.42.2
  (crate-source "windows_x86_64_gnu" "0.42.2"
                "0dnbf2xnp3xrvy8v9mgs3var4zq9v9yh9kv79035rdgyp2w15scd"))

(define rust-windows-x86-64-gnu-0.52.6
  (crate-source "windows_x86_64_gnu" "0.52.6"
                "0y0sifqcb56a56mvn7xjgs8g43p33mfqkd8wj1yhrgxzma05qyhl"))

(define rust-windows-x86-64-gnu-0.53.0
  (crate-source "windows_x86_64_gnu" "0.53.0"
                "1flh84xkssn1n6m1riddipydcksp2pdl45vdf70jygx3ksnbam9f"))

(define rust-windows-x86-64-gnu-0.53.1
  (crate-source "windows_x86_64_gnu" "0.53.1"
                "16d4yiysmfdlsrghndr97y57gh3kljkwhfdbcs05m1jasz6l4f4w"))

(define rust-windows-x86-64-gnullvm-0.42.2
  (crate-source "windows_x86_64_gnullvm" "0.42.2"
                "18wl9r8qbsl475j39zvawlidp1bsbinliwfymr43fibdld31pm16"))

(define rust-windows-x86-64-gnullvm-0.52.6
  (crate-source "windows_x86_64_gnullvm" "0.52.6"
                "03gda7zjx1qh8k9nnlgb7m3w3s1xkysg55hkd1wjch8pqhyv5m94"))

(define rust-windows-x86-64-gnullvm-0.53.0
  (crate-source "windows_x86_64_gnullvm" "0.53.0"
                "0mvc8119xpbi3q2m6mrjcdzl6afx4wffacp13v76g4jrs1fh6vha"))

(define rust-windows-x86-64-gnullvm-0.53.1
  (crate-source "windows_x86_64_gnullvm" "0.53.1"
                "1qbspgv4g3q0vygkg8rnql5c6z3caqv38japiynyivh75ng1gyhg"))

(define rust-windows-x86-64-msvc-0.42.2
  (crate-source "windows_x86_64_msvc" "0.42.2"
                "1w5r0q0yzx827d10dpjza2ww0j8iajqhmb54s735hhaj66imvv4s"))

(define rust-windows-x86-64-msvc-0.52.6
  (crate-source "windows_x86_64_msvc" "0.52.6"
                "1v7rb5cibyzx8vak29pdrk8nx9hycsjs4w0jgms08qk49jl6v7sq"))

(define rust-windows-x86-64-msvc-0.53.0
  (crate-source "windows_x86_64_msvc" "0.53.0"
                "11h4i28hq0zlnjcaqi2xdxr7ibnpa8djfggch9rki1zzb8qi8517"))

(define rust-windows-x86-64-msvc-0.53.1
  (crate-source "windows_x86_64_msvc" "0.53.1"
                "0l6npq76vlq4ksn4bwsncpr8508mk0gmznm6wnhjg95d19gzzfyn"))

(define rust-winnow-0.7.12
  (crate-source "winnow" "0.7.12"
                "159y8inpy86xswmr4yig9hxss0v2fssyqy1kk12504n8jbsfpvgk"))

(define rust-winnow-0.7.14
  (crate-source "winnow" "0.7.14"
                "0a88ahjqhyn2ln1yplq2xsigm09kxqkdkkk2c2mfxkbzszln8lss"))

(define rust-winnow-1.0.4
  (crate-source "winnow" "1.0.4"
                "10fzxipa7lx16172p3aca9j60hzbqgjki2f95kqksd5qywcp7f93"))

(define rust-wit-bindgen-0.46.0
  (crate-source "wit-bindgen" "0.46.0"
                "0ngysw50gp2wrrfxbwgp6dhw1g6sckknsn3wm7l00vaf7n48aypi"))

(define rust-wit-bindgen-0.51.0
  (crate-source "wit-bindgen" "0.51.0"
                "19fazgch8sq5cvjv3ynhhfh5d5x08jq2pkw8jfb05vbcyqcr496p"))

(define rust-wit-bindgen-0.57.1
  (crate-source "wit-bindgen" "0.57.1"
                "0vjk2jb593ri9k1aq4iqs2si9mrw5q46wxnn78im7hm7hx799gqy"))

(define rust-wit-bindgen-rt-0.39.0
  (crate-source "wit-bindgen-rt" "0.39.0"
                "1hd65pa5hp0nl664m94bg554h4zlhrzmkjsf6lsgsb7yc4734hkg"))

(define rust-wl-clipboard-rs-0.9.3
  (crate-source "wl-clipboard-rs" "0.9.3"
                "18xh5q3r9k57v3g2565vr33irldjh99p29x1ydpdk1rfldqi8rg9"))

(define rust-writeable-0.6.2
  (crate-source "writeable" "0.6.2"
                "1fg08y97n6vk7l0rnjggw3xyrii6dcqg54wqaxldrlk98zdy1pcy"))

(define rust-wyz-0.5.1
  (crate-source "wyz" "0.5.1"
                "1vdrfy7i2bznnzjdl9vvrzljvs4s3qm8bnlgqwln6a941gy61wq5"))

(define rust-x11rb-0.13.2
  (crate-source "x11rb" "0.13.2"
                "053lvnaw9ycbl791mgwly2hw27q6vqgzrb1y5kz1as52wmdsm4wr"))

(define rust-x11rb-protocol-0.13.2
  (crate-source "x11rb-protocol" "0.13.2"
                "1g81cznbyn522b0fbis0i44wh3adad2vhsz5pzf99waf3sbc4vza"))

(define rust-xattr-1.6.1
  (crate-source "xattr" "1.6.1"
                "0ml1mb43gqasawillql6b344m0zgq8mz0isi11wj8vbg43a5mr1j"))

(define rust-xdg-3.0.0
  (crate-source "xdg" "3.0.0"
                "1dc5jpkkylp7z54c4xwxzwxx1jb5cklwfjs5493k9y9d7wik7d1g"))

(define rust-xkbcommon-0.7.0
  (crate-source "xkbcommon" "0.7.0"
                "07n9shhcls66wjvmk5pzqql46ipfdv7b8hbc384wgv9hk4jpv1hk"))

(define rust-xkeysym-0.2.1
  (crate-source "xkeysym" "0.2.1"
                "0mksx670cszyd7jln6s7dhkw11hdfv7blwwr3isq98k22ljh1k5r"))

(define rust-xml-rs-0.7.0
  (crate-source "xml-rs" "0.7.0"
                "1hp9kf80y9qm3aiqg5psyshqfkcrjgifbcm2c2nc5qlzs80vc71w"))

(define rust-y4m-0.8.0
  (crate-source "y4m" "0.8.0"
                "0j24y2zf60lpxwd7kyg737hqfyqx16y32s0fjyi6fax6w4hlnnks"))

(define rust-yeslogic-fontconfig-sys-6.0.0
  ;; TODO REVIEW: Check bundled sources.
  (crate-source "yeslogic-fontconfig-sys" "6.0.0"
                "1gcx4brx8xvdpvryixk32b3xn9v80ilvi5frd40l8z039imhcfjh"))

(define rust-yoke-0.8.1
  (crate-source "yoke" "0.8.1"
                "0m29dm0bf5iakxgma0bj6dbmc3b8qi9b1vaw9sa76kdqmz3fbmkj"))

(define rust-yoke-derive-0.8.1
  (crate-source "yoke-derive" "0.8.1"
                "0pbyja133jnng4mrhimzdq4a0y26421g734ybgz8wsgbfhl0andn"))

(define rust-zbus-5.13.2
  (crate-source "zbus" "5.13.2"
                "1ldxqkwy577n7w5ss3lshg9adpyji3vvllj61jr3xahagaczzzhv"))

(define rust-zbus-macros-5.13.2
  (crate-source "zbus_macros" "5.13.2"
                "1wa6z2gzpzna0mww9jj9db9cq573g914ix6y2ddyxzp8vf85mg8b"))

(define rust-zbus-names-4.3.1
  (crate-source "zbus_names" "4.3.1"
                "03y5f8xwzmk4y5wb4g95a1hl48mxlmhcbwqz62mrnqbqbdnszn7z"))

(define rust-zerocopy-0.8.26
  (crate-source "zerocopy" "0.8.26"
                "0bvsj0qzq26zc6nlrm3z10ihvjspyngs7n0jw1fz031i7h6xsf8h"))

(define rust-zerocopy-0.8.31
  (crate-source "zerocopy" "0.8.31"
                "1hwqn8f0zd8h1a7qz2hxym4iaqyzk8kdxgalllydn2i5p6cfqx7x"))

(define rust-zerocopy-0.8.33
  (crate-source "zerocopy" "0.8.33"
                "1z9d6z8p1ndf0yrvw99jr5zcjnd4270kv4rivqqyi7hbs5l533v6"))

(define rust-zerocopy-0.8.39
  (crate-source "zerocopy" "0.8.39"
                "0jmf1iqns5sq07k3dscsgyc706pycar67rrq4j9nrnzacgb3avfv"))

(define rust-zerocopy-0.8.54
  (crate-source "zerocopy" "0.8.54"
                "06cxymy8i9q9a93xdins9ayakx9b1nc2arb7qdfd03ssf05brjxp"))

(define rust-zerocopy-derive-0.8.26
  (crate-source "zerocopy-derive" "0.8.26"
                "10aiywi5qkha0mpsnb1zjwi44wl2rhdncaf3ykbp4i9nqm65pkwy"))

(define rust-zerocopy-derive-0.8.31
  (crate-source "zerocopy-derive" "0.8.31"
                "0sjw20qqxbax8z8k9ifcmwjjlljjddpm0nmvih9zap7lzl4x5a6q"))

(define rust-zerocopy-derive-0.8.33
  (crate-source "zerocopy-derive" "0.8.33"
                "1wbh4bil3kqfmiwxlpzhxba6fyh09nsy87k7idk8b1hadfr64y9c"))

(define rust-zerocopy-derive-0.8.39
  (crate-source "zerocopy-derive" "0.8.39"
                "05z5yfq0mx3xdqadrgq5sd4d03nl82d9r0vp1qchaip9d4qws8j1"))

(define rust-zerocopy-derive-0.8.54
  (crate-source "zerocopy-derive" "0.8.54"
                "1xb292dhgb0d4fs05cdj2s0v3srmk7bajv94sdc7631dnnvigs72"))

(define rust-zerofrom-0.1.6
  (crate-source "zerofrom" "0.1.6"
                "19dyky67zkjichsb7ykhv0aqws3q0jfvzww76l66c19y6gh45k2h"))

(define rust-zerofrom-derive-0.1.6
  (crate-source "zerofrom-derive" "0.1.6"
                "00l5niw7c1b0lf1vhvajpjmcnbdp2vn96jg4nmkhq2db0rp5s7np"))

(define rust-zeroize-1.8.1
  (crate-source "zeroize" "1.8.1"
                "1pjdrmjwmszpxfd7r860jx54cyk94qk59x13sc307cvr5256glyf"))

(define rust-zeroize-1.8.2
  (crate-source "zeroize" "1.8.2"
                "1l48zxgcv34d7kjskr610zqsm6j2b4fcr2vfh9jm9j1jgvk58wdr"))

(define rust-zerotrie-0.2.3
  (crate-source "zerotrie" "0.2.3"
                "0lbqznlqazmrwwzslw0ci7p3pqxykrbfhq29npj0gmb2amxc2n9a"))

(define rust-zerovec-0.11.5
  (crate-source "zerovec" "0.11.5"
                "00m0p47k2g9mkv505hky5xh3r6ps7v8qc0dy4pspg542jj972a3c"))

(define rust-zerovec-derive-0.11.2
  (crate-source "zerovec-derive" "0.11.2"
                "1wsig4h5j7a1scd5hrlnragnazjny9qjc44hancb6p6a76ay7p7a"))

(define rust-zip-2.4.2
  (crate-source "zip" "2.4.2"
                "0l5s7sycj0w42hnkmj6vnrzcp3dn4smffg06a8f5my08x4j67gps"))

(define rust-zipsign-api-0.1.5
  (crate-source "zipsign-api" "0.1.5"
                "1h20rb71gcidgjclw19nz0hfb0dyk8v6vlddcnkxknrcz0zhd9nv"))

(define rust-zmij-0.1.9
  (crate-source "zmij" "0.1.9"
                "0nk1521fadpb9q9pv8yp2r9rmyw2xxipnafr4wwslii98v6mw2fh"))

(define rust-zmij-1.0.12
  (crate-source "zmij" "1.0.12"
                "1y3ryrh5rg1aqv92vndmf0680jyczni5m6fy3cjz32q741madi9g"))

(define rust-zmij-1.0.16
  (crate-source "zmij" "1.0.16"
                "0r8swld9cwnyvdfamq4063ngwxdzckg4922ayk7likma4mc19kfz"))

(define rust-zmij-1.0.19
  (crate-source "zmij" "1.0.19"
                "0i9lpsfa4sgq52dnrli9z3sc2rllwawyc6jp6x38jf4hma65zw1z"))

(define rust-zmij-1.0.23
  (crate-source "zmij" "1.0.23"
                "06zwri21nnrl34rwinmvbciap8yk1mrl8qfg9pff7lgspc56sri9"))

(define rust-zopfli-0.8.3
  (crate-source "zopfli" "0.8.3"
                "0jaj5dyh3mks0805h4ldrsh5pwq4i2jc9dc9zwjm91k3gmwxhp7h"))

(define rust-zune-core-0.4.12
  (crate-source "zune-core" "0.4.12"
                "0jj1ra86klzlcj9aha9als9d1dzs7pqv3azs1j3n96822wn3lhiz"))

(define rust-zune-core-0.5.1
  (crate-source "zune-core" "0.5.1"
                "1ya0zdqxlr5v57791j7bvm408ri2cfx81a4v6z85f560yw3hi2nb"))

(define rust-zune-inflate-0.2.54
  (crate-source "zune-inflate" "0.2.54"
                "00kg24jh3zqa3i6rg6yksnb71bch9yi1casqydl00s7nw8pk7avk"))

(define rust-zune-jpeg-0.4.19
  (crate-source "zune-jpeg" "0.4.19"
                "0sisqjhwi6pwlnjyr80vl5s6p5w9z2vi8pz967h5i9m6y1d557ic"))

(define rust-zune-jpeg-0.4.21
  (crate-source "zune-jpeg" "0.4.21"
                "04r7g6y9jp7d4c9bq23rz3gwzlr1dsl7vdk4yly35bc4jf52rki9"))

(define rust-zune-jpeg-0.5.15
  (crate-source "zune-jpeg" "0.5.15"
                "15kjpn6pywxlwb8w5irfd68x31wi3mb4y1da8bqh7havh5drvg17"))

(define rust-zvariant-5.9.2
  (crate-source "zvariant" "5.9.2"
                "1i1jn8lvsj79lnfyw21lrsimg2jj0gfj6w6wglrm2y8cyks4xdk8"))

(define rust-zvariant-derive-5.9.2
  (crate-source "zvariant_derive" "5.9.2"
                "0p21bv2kzphhcc71597ya3b0m8hr6wyw2adrqqnbbbxpbsbmska8"))

(define rust-zvariant-utils-3.3.0
  (crate-source "zvariant_utils" "3.3.0"
                "1sf5i71in36gc08jhak83pprnkam8gk936cqlq9hzx7q9sk26p7p"))

(define ssss-separator 'end-of-crates)

;;;
;;; Cargo inputs.
;;;

(define-cargo-inputs lookup-cargo-inputs
                     (dust =>
                           (list rust-aho-corasick-1.1.4
                                 rust-android-system-properties-0.1.5
                                 rust-anstream-0.6.21
                                 rust-anstyle-1.0.13
                                 rust-anstyle-parse-0.2.7
                                 rust-anstyle-query-1.1.5
                                 rust-anstyle-wincon-3.0.11
                                 rust-assert-cmd-2.1.1
                                 rust-autocfg-1.5.0
                                 rust-bitflags-2.10.0
                                 rust-block2-0.6.2
                                 rust-bstr-1.12.1
                                 rust-bumpalo-3.19.1
                                 rust-cc-1.2.51
                                 rust-cfg-if-1.0.4
                                 rust-cfg-aliases-0.2.1
                                 rust-chrono-0.4.42
                                 rust-clap-4.5.54
                                 rust-clap-builder-4.5.54
                                 rust-clap-complete-4.5.65
                                 rust-clap-derive-4.5.49
                                 rust-clap-lex-0.7.6
                                 rust-clap-mangen-0.2.31
                                 rust-colorchoice-1.0.4
                                 rust-config-file-0.2.3
                                 rust-core-foundation-sys-0.8.7
                                 rust-crossbeam-deque-0.8.6
                                 rust-crossbeam-epoch-0.9.18
                                 rust-crossbeam-utils-0.8.21
                                 rust-ctrlc-3.5.1
                                 rust-difflib-0.4.0
                                 rust-dispatch2-0.3.0
                                 rust-either-1.15.0
                                 rust-errno-0.3.14
                                 rust-fastrand-2.3.0
                                 rust-filesize-0.2.0
                                 rust-find-msvc-tools-0.1.6
                                 rust-getrandom-0.3.4
                                 rust-heck-0.5.0
                                 rust-iana-time-zone-0.1.64
                                 rust-iana-time-zone-haiku-0.1.2
                                 rust-is-terminal-polyfill-1.70.2
                                 rust-itoa-1.0.17
                                 rust-js-sys-0.3.83
                                 rust-libc-0.2.180
                                 rust-linux-raw-sys-0.11.0
                                 rust-log-0.4.29
                                 rust-lscolors-0.21.0
                                 rust-memchr-2.7.6
                                 rust-nix-0.30.1
                                 rust-ntapi-0.4.2
                                 rust-nu-ansi-term-0.50.3
                                 rust-num-traits-0.2.19
                                 rust-objc2-0.6.3
                                 rust-objc2-core-foundation-0.3.2
                                 rust-objc2-encode-4.1.0
                                 rust-objc2-io-kit-0.3.2
                                 rust-once-cell-1.21.3
                                 rust-once-cell-polyfill-1.70.2
                                 rust-portable-atomic-1.13.0
                                 rust-predicates-3.1.3
                                 rust-predicates-core-1.0.9
                                 rust-predicates-tree-1.0.12
                                 rust-proc-macro2-1.0.105
                                 rust-quote-1.0.43
                                 rust-r-efi-5.3.0
                                 rust-rayon-1.11.0
                                 rust-rayon-core-1.13.0
                                 rust-regex-1.12.2
                                 rust-regex-automata-0.4.13
                                 rust-regex-syntax-0.8.8
                                 rust-roff-0.2.2
                                 rust-rustix-1.1.3
                                 rust-rustversion-1.0.22
                                 rust-serde-1.0.228
                                 rust-serde-core-1.0.228
                                 rust-serde-derive-1.0.228
                                 rust-serde-json-1.0.149
                                 rust-shlex-1.3.0
                                 rust-stfu8-0.2.7
                                 rust-strsim-0.11.1
                                 rust-syn-2.0.114
                                 rust-sysinfo-0.37.2
                                 rust-tempfile-3.24.0
                                 rust-terminal-size-0.4.3
                                 rust-termtree-0.5.1
                                 rust-thiserror-1.0.69
                                 rust-thiserror-impl-1.0.69
                                 rust-thousands-0.2.0
                                 rust-toml-0.5.11
                                 rust-unicode-ident-1.0.22
                                 rust-unicode-width-0.2.2
                                 rust-utf8parse-0.2.2
                                 rust-wait-timeout-0.2.1
                                 rust-wasip2-1.0.1+wasi-0.2.4
                                 rust-wasm-bindgen-0.2.106
                                 rust-wasm-bindgen-macro-0.2.106
                                 rust-wasm-bindgen-macro-support-0.2.106
                                 rust-wasm-bindgen-shared-0.2.106
                                 rust-winapi-0.3.9
                                 rust-winapi-i686-pc-windows-gnu-0.4.0
                                 rust-winapi-util-0.1.11
                                 rust-winapi-x86-64-pc-windows-gnu-0.4.0
                                 rust-windows-0.61.3
                                 rust-windows-collections-0.2.0
                                 rust-windows-core-0.61.2
                                 rust-windows-core-0.62.2
                                 rust-windows-future-0.2.1
                                 rust-windows-implement-0.60.2
                                 rust-windows-interface-0.59.3
                                 rust-windows-link-0.1.3
                                 rust-windows-link-0.2.1
                                 rust-windows-numerics-0.2.0
                                 rust-windows-result-0.3.4
                                 rust-windows-result-0.4.1
                                 rust-windows-strings-0.4.2
                                 rust-windows-strings-0.5.1
                                 rust-windows-sys-0.60.2
                                 rust-windows-sys-0.61.2
                                 rust-windows-targets-0.53.5
                                 rust-windows-threading-0.1.0
                                 rust-windows-aarch64-gnullvm-0.53.1
                                 rust-windows-aarch64-msvc-0.53.1
                                 rust-windows-i686-gnu-0.53.1
                                 rust-windows-i686-gnullvm-0.53.1
                                 rust-windows-i686-msvc-0.53.1
                                 rust-windows-x86-64-gnu-0.53.1
                                 rust-windows-x86-64-gnullvm-0.53.1
                                 rust-windows-x86-64-msvc-0.53.1
                                 rust-wit-bindgen-0.46.0
                                 rust-zmij-1.0.12))
                     (lutgen =>
                             (list rust-adler2-2.0.1
                                   rust-aho-corasick-1.1.4
                                   rust-aligned-0.4.3
                                   rust-aligned-vec-0.6.4
                                   rust-anyhow-1.0.104
                                   rust-approx-0.5.1
                                   rust-arbitrary-1.4.2
                                   rust-arg-enum-proc-macro-0.3.4
                                   rust-array-init-2.1.0
                                   rust-arrayref-0.3.9
                                   rust-arrayvec-0.7.8
                                   rust-as-slice-0.2.1
                                   rust-autocfg-1.5.1
                                   rust-av-scenechange-0.14.1
                                   rust-av1-grain-0.2.5
                                   rust-avif-serialize-0.8.9
                                   rust-az-1.3.0
                                   rust-bit-field-0.10.3
                                   rust-bitflags-2.13.1
                                   rust-bitstream-io-4.10.0
                                   rust-bitvec-1.1.1
                                   rust-bpaf-0.9.26
                                   rust-bpaf-derive-0.5.26
                                   rust-built-0.8.1
                                   rust-bumpalo-3.20.3
                                   rust-by-address-1.2.1
                                   rust-bytemuck-1.25.2
                                   rust-byteorder-lite-0.1.0
                                   rust-cc-1.3.0
                                   rust-cfg-if-1.0.4
                                   rust-chacha20-0.10.1
                                   rust-cmov-0.5.4
                                   rust-color-quant-1.1.0
                                   rust-cpufeatures-0.3.0
                                   rust-crc32fast-1.5.0
                                   rust-crossbeam-deque-0.8.7
                                   rust-crossbeam-epoch-0.9.20
                                   rust-crossbeam-utils-0.8.22
                                   rust-crunchy-0.2.4
                                   rust-dirs-6.0.0
                                   rust-dirs-sys-0.5.0
                                   rust-divrem-1.0.0
                                   rust-either-1.16.0
                                   rust-equator-0.4.2
                                   rust-equator-macro-0.4.2
                                   rust-equivalent-1.0.2
                                   rust-exr-1.74.2
                                   rust-fast-srgb8-1.0.0
                                   rust-fax-0.2.7
                                   rust-fdeflate-0.3.7
                                   rust-find-msvc-tools-0.1.9
                                   rust-fixed-1.29.0
                                   rust-flate2-1.1.9
                                   rust-foldhash-0.1.5
                                   rust-funty-2.0.0
                                   rust-generator-0.8.9
                                   rust-getrandom-0.2.17
                                   rust-getrandom-0.3.4
                                   rust-getrandom-0.4.3
                                   rust-gif-0.14.2
                                   rust-half-2.7.1
                                   rust-hashbrown-0.15.5
                                   rust-hashbrown-0.17.1
                                   rust-heck-0.5.0
                                   rust-image-0.25.10
                                   rust-image-webp-0.2.4
                                   rust-imara-diff-0.2.0
                                   rust-imgref-1.12.2
                                   rust-indexmap-2.14.0
                                   rust-interpolate-name-0.2.4
                                   rust-is-ci-1.2.0
                                   rust-itertools-0.14.0
                                   rust-itoa-1.0.18
                                   rust-jobserver-0.1.35
                                   rust-kiddo-5.3.2
                                   rust-lazy-static-1.5.0
                                   rust-lebe-0.5.3
                                   rust-libc-0.2.186
                                   rust-libfuzzer-sys-0.4.13
                                   rust-libm-0.2.16
                                   rust-libredox-0.1.18
                                   rust-log-0.4.33
                                   rust-loop9-0.1.5
                                   rust-lutgen-0.15.0
                                   rust-lutgen-palettes-0.4.2
                                   rust-maybe-rayon-0.1.1
                                   rust-memchr-2.8.3
                                   rust-miniz-oxide-0.8.9
                                   rust-moxcms-0.8.1
                                   rust-new-debug-unreachable-1.0.6
                                   rust-no-std-io2-0.9.4
                                   rust-nom-8.0.0
                                   rust-noop-proc-macro-0.3.0
                                   rust-nu-ansi-term-0.50.3
                                   rust-num-bigint-0.4.8
                                   rust-num-complex-0.4.6
                                   rust-num-derive-0.4.2
                                   rust-num-integer-0.1.46
                                   rust-num-rational-0.4.2
                                   rust-num-traits-0.2.19
                                   rust-oklab-1.1.2
                                   rust-once-cell-1.21.4
                                   rust-option-ext-0.2.0
                                   rust-ordered-float-4.6.0
                                   rust-ordered-float-5.3.0
                                   rust-owo-colors-4.3.0
                                   rust-palette-0.7.6
                                   rust-palette-derive-0.7.6
                                   rust-paste-1.0.15
                                   rust-pastey-0.1.1
                                   rust-pin-project-lite-0.2.17
                                   rust-png-0.18.1
                                   rust-ppv-lite86-0.2.21
                                   rust-proc-macro2-1.0.107
                                   rust-profiling-1.0.18
                                   rust-profiling-procmacros-1.0.18
                                   rust-pulp-0.22.3
                                   rust-pulp-wasm-simd-flag-0.1.1
                                   rust-pxfm-0.1.30
                                   rust-qoi-0.4.1
                                   rust-quantette-0.3.0
                                   rust-quick-error-2.0.1
                                   rust-quote-1.0.47
                                   rust-r-efi-5.3.0
                                   rust-r-efi-6.0.0
                                   rust-radium-0.7.0
                                   rust-rand-0.8.7
                                   rust-rand-0.9.5
                                   rust-rand-0.10.2
                                   rust-rand-chacha-0.9.0
                                   rust-rand-core-0.6.4
                                   rust-rand-core-0.9.5
                                   rust-rand-core-0.10.1
                                   rust-rand-distr-0.4.3
                                   rust-rand-distr-0.6.0
                                   rust-rand-xoshiro-0.6.0
                                   rust-rav1e-0.8.1
                                   rust-ravif-0.13.0
                                   rust-raw-cpuid-11.6.0
                                   rust-rayon-1.12.0
                                   rust-rayon-core-1.13.0
                                   rust-reborrow-0.5.5
                                   rust-redox-users-0.5.2
                                   rust-regex-1.13.1
                                   rust-regex-automata-0.4.16
                                   rust-regex-syntax-0.8.11
                                   rust-rgb-0.8.53
                                   rust-rustversion-1.0.23
                                   rust-safe-arch-0.7.4
                                   rust-serde-1.0.229
                                   rust-serde-core-1.0.229
                                   rust-serde-derive-1.0.229
                                   rust-serde-json-1.0.151
                                   rust-serde-spanned-1.1.1
                                   rust-sharded-slab-0.1.7
                                   rust-shlex-2.0.1
                                   rust-simd-adler32-0.3.10
                                   rust-simd-helpers-0.1.0
                                   rust-smallvec-1.15.2
                                   rust-sorted-vec-0.8.11
                                   rust-stable-deref-trait-1.2.1
                                   rust-strsim-0.11.1
                                   rust-strum-0.28.0
                                   rust-strum-macros-0.28.0
                                   rust-supports-color-3.0.2
                                   rust-syn-2.0.119
                                   rust-syn-3.0.2
                                   rust-tap-1.0.1
                                   rust-thiserror-2.0.19
                                   rust-thiserror-impl-2.0.19
                                   rust-thread-local-1.1.10
                                   rust-tiff-0.11.3
                                   rust-tinytemplate-1.2.1
                                   rust-toml-1.1.3+spec-1.1.0
                                   rust-toml-datetime-1.1.1+spec-1.1.0
                                   rust-toml-parser-1.1.2+spec-1.1.0
                                   rust-toml-writer-1.1.2+spec-1.1.0
                                   rust-tracing-0.1.44
                                   rust-tracing-attributes-0.1.31
                                   rust-tracing-core-0.1.36
                                   rust-tracing-log-0.2.0
                                   rust-tracing-subscriber-0.3.23
                                   rust-typenum-1.20.1
                                   rust-unicode-ident-1.0.24
                                   rust-v-frame-0.3.9
                                   rust-valuable-0.1.1
                                   rust-version-check-0.9.5
                                   rust-wasi-0.11.1+wasi-snapshot-preview1
                                   rust-wasip2-1.0.4+wasi-0.2.12
                                   rust-wasm-bindgen-0.2.126
                                   rust-wasm-bindgen-macro-0.2.126
                                   rust-wasm-bindgen-macro-support-0.2.126
                                   rust-wasm-bindgen-shared-0.2.126
                                   rust-weezl-0.1.12
                                   rust-wide-0.7.33
                                   rust-windows-link-0.2.1
                                   rust-windows-result-0.4.1
                                   rust-windows-sys-0.61.2
                                   rust-winnow-1.0.4
                                   rust-wit-bindgen-0.57.1
                                   rust-wyz-0.5.1
                                   rust-y4m-0.8.0
                                   rust-zerocopy-0.8.54
                                   rust-zerocopy-derive-0.8.54
                                   rust-zmij-1.0.23
                                   rust-zune-core-0.5.1
                                   rust-zune-inflate-0.2.54
                                   rust-zune-jpeg-0.5.15))
                     (rbw =>
                          (list rust-aes-0.8.4
                                rust-aho-corasick-1.1.4
                                rust-anstream-0.6.21
                                rust-anstyle-1.0.13
                                rust-anstyle-parse-0.2.7
                                rust-anstyle-query-1.1.5
                                rust-anstyle-wincon-3.0.11
                                rust-anyhow-1.0.100
                                rust-arboard-3.6.1
                                rust-argon2-0.5.3
                                rust-arrayvec-0.7.6
                                rust-async-trait-0.1.89
                                rust-atomic-waker-1.1.2
                                rust-autocfg-1.5.0
                                rust-axum-0.8.8
                                rust-axum-core-0.5.5
                                rust-base16ct-0.2.0
                                rust-base32-0.5.1
                                rust-base64-0.22.1
                                rust-base64ct-1.8.1
                                rust-bitflags-1.3.2
                                rust-bitflags-2.10.0
                                rust-blake2-0.10.6
                                rust-block-buffer-0.10.4
                                rust-block-padding-0.3.3
                                rust-bumpalo-3.19.1
                                rust-byteorder-1.5.0
                                rust-bytes-1.11.0
                                rust-cbc-0.1.2
                                rust-cc-1.2.50
                                rust-cfg-if-1.0.4
                                rust-cfg-aliases-0.2.1
                                rust-cipher-0.4.4
                                rust-clap-4.5.53
                                rust-clap-builder-4.5.53
                                rust-clap-complete-4.5.62
                                rust-clap-complete-fig-4.5.2
                                rust-clap-complete-nushell-4.5.10
                                rust-clap-derive-4.5.49
                                rust-clap-lex-0.7.6
                                rust-clipboard-win-5.4.1
                                rust-colorchoice-1.0.4
                                rust-const-oid-0.9.6
                                rust-constant-time-eq-0.3.1
                                rust-core-foundation-0.10.1
                                rust-core-foundation-sys-0.8.7
                                rust-cpufeatures-0.2.17
                                rust-crypto-bigint-0.5.5
                                rust-crypto-common-0.1.7
                                rust-curve25519-dalek-4.1.3
                                rust-curve25519-dalek-derive-0.1.1
                                rust-daemonize-0.5.0
                                rust-data-encoding-2.9.0
                                rust-der-0.7.10
                                rust-digest-0.10.7
                                rust-directories-6.0.0
                                rust-dirs-sys-0.5.0
                                rust-dispatch2-0.3.0
                                rust-displaydoc-0.2.5
                                rust-downcast-rs-1.2.1
                                rust-ecdsa-0.16.9
                                rust-ed25519-2.2.3
                                rust-ed25519-dalek-2.2.0
                                rust-elliptic-curve-0.13.8
                                rust-env-filter-0.1.4
                                rust-env-logger-0.11.8
                                rust-equivalent-1.0.2
                                rust-errno-0.3.14
                                rust-error-code-3.3.2
                                rust-fastrand-2.3.0
                                rust-ff-0.13.1
                                rust-fiat-crypto-0.2.9
                                rust-find-msvc-tools-0.1.5
                                rust-fixedbitset-0.4.2
                                rust-form-urlencoded-1.2.2
                                rust-futures-0.3.31
                                rust-futures-channel-0.3.31
                                rust-futures-core-0.3.31
                                rust-futures-executor-0.3.31
                                rust-futures-io-0.3.31
                                rust-futures-macro-0.3.31
                                rust-futures-sink-0.3.31
                                rust-futures-task-0.3.31
                                rust-futures-util-0.3.31
                                rust-generic-array-0.14.7
                                rust-gethostname-1.1.0
                                rust-getrandom-0.2.16
                                rust-getrandom-0.3.4
                                rust-group-0.13.0
                                rust-hashbrown-0.16.1
                                rust-heck-0.5.0
                                rust-hermit-abi-0.5.2
                                rust-hkdf-0.12.4
                                rust-hmac-0.12.1
                                rust-http-1.4.0
                                rust-http-body-1.0.1
                                rust-http-body-util-0.1.3
                                rust-httparse-1.10.1
                                rust-httpdate-1.0.3
                                rust-humantime-2.3.0
                                rust-hyper-1.8.1
                                rust-hyper-rustls-0.27.7
                                rust-hyper-util-0.1.19
                                rust-icu-collections-2.1.1
                                rust-icu-locale-core-2.1.1
                                rust-icu-normalizer-2.1.1
                                rust-icu-normalizer-data-2.1.1
                                rust-icu-properties-2.1.2
                                rust-icu-properties-data-2.1.2
                                rust-icu-provider-2.1.1
                                rust-idna-1.1.0
                                rust-idna-adapter-1.2.1
                                rust-indexmap-2.12.1
                                rust-inout-0.1.4
                                rust-ipnet-2.11.0
                                rust-iri-string-0.7.9
                                rust-is-docker-0.2.0
                                rust-is-terminal-0.4.17
                                rust-is-wsl-0.4.0
                                rust-is-terminal-polyfill-1.70.2
                                rust-itoa-1.0.16
                                rust-jiff-0.2.17
                                rust-jiff-static-0.2.17
                                rust-js-sys-0.3.83
                                rust-lazy-static-1.5.0
                                rust-libc-0.2.178
                                rust-libm-0.2.15
                                rust-libredox-0.1.11
                                rust-linux-raw-sys-0.11.0
                                rust-litemap-0.8.1
                                rust-lock-api-0.4.14
                                rust-log-0.4.29
                                rust-lru-slab-0.1.2
                                rust-mach2-0.4.3
                                rust-matchit-0.8.4
                                rust-memchr-2.7.6
                                rust-mime-0.3.17
                                rust-minimal-lexical-0.2.1
                                rust-mio-1.1.1
                                rust-nom-7.1.3
                                rust-num-bigint-dig-0.8.6
                                rust-num-integer-0.1.46
                                rust-num-iter-0.1.45
                                rust-num-traits-0.2.19
                                rust-objc2-0.6.3
                                rust-objc2-app-kit-0.3.2
                                rust-objc2-core-foundation-0.3.2
                                rust-objc2-core-graphics-0.3.2
                                rust-objc2-encode-4.1.0
                                rust-objc2-foundation-0.3.2
                                rust-objc2-io-surface-0.3.2
                                rust-once-cell-1.21.3
                                rust-once-cell-polyfill-1.70.2
                                rust-open-5.3.3
                                rust-openssl-probe-0.1.6
                                rust-option-ext-0.2.0
                                rust-os-pipe-1.2.3
                                rust-p256-0.13.2
                                rust-p384-0.13.1
                                rust-p521-0.13.3
                                rust-parking-lot-0.12.5
                                rust-parking-lot-core-0.9.12
                                rust-password-hash-0.5.0
                                rust-pathdiff-0.2.3
                                rust-pbkdf2-0.12.2
                                rust-pem-rfc7468-0.7.0
                                rust-percent-encoding-2.3.2
                                rust-petgraph-0.6.5
                                rust-pin-project-lite-0.2.16
                                rust-pin-utils-0.1.0
                                rust-pkcs1-0.7.5
                                rust-pkcs8-0.10.2
                                rust-pkg-config-0.3.32
                                rust-portable-atomic-1.12.0
                                rust-portable-atomic-util-0.2.4
                                rust-potential-utf-0.1.4
                                rust-ppv-lite86-0.2.21
                                rust-primeorder-0.13.6
                                rust-proc-macro2-1.0.103
                                rust-quick-xml-0.37.5
                                rust-quinn-0.11.9
                                rust-quinn-proto-0.11.13
                                rust-quinn-udp-0.5.14
                                rust-quote-1.0.42
                                rust-r-efi-5.3.0
                                rust-rand-0.8.5
                                rust-rand-0.9.2
                                rust-rand-chacha-0.3.1
                                rust-rand-chacha-0.9.0
                                rust-rand-core-0.6.4
                                rust-rand-core-0.9.3
                                rust-raunch-1.0.1
                                rust-redox-syscall-0.5.18
                                rust-redox-users-0.5.2
                                rust-regex-1.12.2
                                rust-regex-automata-0.4.13
                                rust-regex-syntax-0.8.8
                                rust-region-3.0.2
                                rust-reqwest-0.12.28
                                rust-rfc6979-0.4.0
                                rust-ring-0.17.14
                                rust-rmp-0.8.15
                                rust-rmpv-1.3.1
                                rust-rsa-0.9.9
                                rust-rustc-hash-2.1.1
                                rust-rustc-version-0.4.1
                                rust-rustix-1.1.3
                                rust-rustls-0.23.35
                                rust-rustls-native-certs-0.8.2
                                rust-rustls-pki-types-1.13.2
                                rust-rustls-webpki-0.103.8
                                rust-rustversion-1.0.22
                                rust-ryu-1.0.21
                                rust-schannel-0.1.28
                                rust-scopeguard-1.2.0
                                rust-sec1-0.7.3
                                rust-secrecy-0.8.0
                                rust-security-framework-3.5.1
                                rust-security-framework-sys-2.15.0
                                rust-semver-1.0.27
                                rust-serde-1.0.228
                                rust-serde-core-1.0.228
                                rust-serde-derive-1.0.228
                                rust-serde-json-1.0.147
                                rust-serde-path-to-error-0.1.20
                                rust-serde-repr-0.1.20
                                rust-serde-urlencoded-0.7.1
                                rust-service-binding-3.0.0
                                rust-sha1-0.10.6
                                rust-sha2-0.10.9
                                rust-shlex-1.3.0
                                rust-signal-hook-registry-1.4.8
                                rust-signature-2.2.0
                                rust-slab-0.4.11
                                rust-smallvec-1.15.1
                                rust-smawk-0.3.2
                                rust-socket2-0.6.1
                                rust-spin-0.9.8
                                rust-spki-0.7.3
                                rust-ssh-agent-lib-0.5.1
                                rust-ssh-cipher-0.2.0
                                rust-ssh-encoding-0.2.0
                                rust-ssh-key-0.6.7
                                rust-stable-deref-trait-1.2.1
                                rust-strsim-0.11.1
                                rust-subtle-2.6.1
                                rust-syn-2.0.111
                                rust-sync-wrapper-1.0.2
                                rust-synstructure-0.13.2
                                rust-tempfile-3.24.0
                                rust-terminal-size-0.4.3
                                rust-textwrap-0.16.2
                                rust-thiserror-1.0.69
                                rust-thiserror-2.0.17
                                rust-thiserror-impl-1.0.69
                                rust-thiserror-impl-2.0.17
                                rust-tinystr-0.8.2
                                rust-tinyvec-1.10.0
                                rust-tinyvec-macros-0.1.1
                                rust-tokio-1.48.0
                                rust-tokio-macros-2.6.0
                                rust-tokio-rustls-0.26.4
                                rust-tokio-stream-0.1.17
                                rust-tokio-tungstenite-0.28.0
                                rust-tokio-util-0.7.17
                                rust-totp-rs-5.7.0
                                rust-tower-0.5.2
                                rust-tower-http-0.6.8
                                rust-tower-layer-0.3.3
                                rust-tower-service-0.3.3
                                rust-tracing-0.1.44
                                rust-tracing-core-0.1.36
                                rust-tree-magic-mini-3.2.0
                                rust-try-lock-0.2.5
                                rust-tungstenite-0.28.0
                                rust-typenum-1.19.0
                                rust-unicode-ident-1.0.22
                                rust-unicode-linebreak-0.1.5
                                rust-unicode-width-0.2.2
                                rust-untrusted-0.9.0
                                rust-url-2.5.7
                                rust-urlencoding-2.1.3
                                rust-utf-8-0.7.6
                                rust-utf8-iter-1.0.4
                                rust-utf8parse-0.2.2
                                rust-uuid-1.19.0
                                rust-version-check-0.9.5
                                rust-want-0.3.1
                                rust-wasi-0.11.1+wasi-snapshot-preview1
                                rust-wasip2-1.0.1+wasi-0.2.4
                                rust-wasm-bindgen-0.2.106
                                rust-wasm-bindgen-futures-0.4.56
                                rust-wasm-bindgen-macro-0.2.106
                                rust-wasm-bindgen-macro-support-0.2.106
                                rust-wasm-bindgen-shared-0.2.106
                                rust-wayland-backend-0.3.11
                                rust-wayland-client-0.31.11
                                rust-wayland-protocols-0.32.9
                                rust-wayland-protocols-wlr-0.3.9
                                rust-wayland-scanner-0.31.7
                                rust-wayland-sys-0.31.7
                                rust-web-sys-0.3.83
                                rust-web-time-1.1.0
                                rust-windows-link-0.2.1
                                rust-windows-sys-0.52.0
                                rust-windows-sys-0.60.2
                                rust-windows-sys-0.61.2
                                rust-windows-targets-0.52.6
                                rust-windows-targets-0.53.5
                                rust-windows-aarch64-gnullvm-0.52.6
                                rust-windows-aarch64-gnullvm-0.53.1
                                rust-windows-aarch64-msvc-0.52.6
                                rust-windows-aarch64-msvc-0.53.1
                                rust-windows-i686-gnu-0.52.6
                                rust-windows-i686-gnu-0.53.1
                                rust-windows-i686-gnullvm-0.52.6
                                rust-windows-i686-gnullvm-0.53.1
                                rust-windows-i686-msvc-0.52.6
                                rust-windows-i686-msvc-0.53.1
                                rust-windows-x86-64-gnu-0.52.6
                                rust-windows-x86-64-gnu-0.53.1
                                rust-windows-x86-64-gnullvm-0.52.6
                                rust-windows-x86-64-gnullvm-0.53.1
                                rust-windows-x86-64-msvc-0.52.6
                                rust-windows-x86-64-msvc-0.53.1
                                rust-wit-bindgen-0.46.0
                                rust-wl-clipboard-rs-0.9.3
                                rust-writeable-0.6.2
                                rust-x11rb-0.13.2
                                rust-x11rb-protocol-0.13.2
                                rust-yoke-0.8.1
                                rust-yoke-derive-0.8.1
                                rust-zerocopy-0.8.31
                                rust-zerocopy-derive-0.8.31
                                rust-zerofrom-0.1.6
                                rust-zerofrom-derive-0.1.6
                                rust-zeroize-1.8.2
                                rust-zerotrie-0.2.3
                                rust-zerovec-0.11.5
                                rust-zerovec-derive-0.11.2
                                rust-zmij-0.1.9))
                     (satty =>
                            (list rust-adler2-2.0.1
                                  rust-android-system-properties-0.1.5
                                  rust-anstream-0.6.21
                                  rust-anstyle-1.0.13
                                  rust-anstyle-parse-0.2.7
                                  rust-anstyle-query-1.1.5
                                  rust-anstyle-wincon-3.0.11
                                  rust-anyhow-1.0.101
                                  rust-arraydeque-0.5.1
                                  rust-arrayvec-0.7.6
                                  rust-autocfg-1.5.0
                                  rust-bitflags-1.3.2
                                  rust-bitflags-2.10.0
                                  rust-bumpalo-3.19.1
                                  rust-bytemuck-1.25.0
                                  rust-bytemuck-derive-1.10.2
                                  rust-byteorder-lite-0.1.0
                                  rust-cairo-rs-0.21.5
                                  rust-cairo-sys-rs-0.21.5
                                  rust-cc-1.2.55
                                  rust-cfg-expr-0.20.6
                                  rust-cfg-if-1.0.4
                                  rust-chrono-0.4.43
                                  rust-clap-4.5.57
                                  rust-clap-builder-4.5.57
                                  rust-clap-complete-4.5.65
                                  rust-clap-complete-fig-4.5.2
                                  rust-clap-complete-nushell-4.5.10
                                  rust-clap-derive-4.5.55
                                  rust-clap-lex-0.7.7
                                  rust-colorchoice-1.0.4
                                  rust-core-foundation-sys-0.8.7
                                  rust-core-maths-0.1.1
                                  rust-crc32fast-1.5.0
                                  rust-dlib-0.5.2
                                  rust-either-1.15.0
                                  rust-endi-1.1.1
                                  rust-epoxy-0.1.0
                                  rust-equivalent-1.0.2
                                  rust-fastrand-2.3.0
                                  rust-femtovg-0.20.1
                                  rust-field-offset-0.3.6
                                  rust-find-msvc-tools-0.1.9
                                  rust-flate2-1.1.9
                                  rust-flume-0.12.0
                                  rust-fnv-1.0.7
                                  rust-fontconfig-0.10.0
                                  rust-fragile-2.0.1
                                  rust-futures-0.3.31
                                  rust-futures-channel-0.3.31
                                  rust-futures-core-0.3.31
                                  rust-futures-executor-0.3.31
                                  rust-futures-io-0.3.31
                                  rust-futures-macro-0.3.31
                                  rust-futures-sink-0.3.31
                                  rust-futures-task-0.3.31
                                  rust-futures-util-0.3.31
                                  rust-gdk-pixbuf-0.21.5
                                  rust-gdk-pixbuf-sys-0.21.5
                                  rust-gdk4-0.10.3
                                  rust-gdk4-sys-0.10.3
                                  rust-getrandom-0.2.17
                                  rust-gio-0.21.5
                                  rust-gio-sys-0.21.5
                                  rust-gl-generator-0.9.0
                                  rust-glib-0.21.5
                                  rust-glib-macros-0.21.5
                                  rust-glib-sys-0.21.5
                                  rust-glow-0.16.0
                                  rust-gobject-sys-0.21.5
                                  rust-graphene-rs-0.21.5
                                  rust-graphene-sys-0.21.5
                                  rust-gsk4-0.10.3
                                  rust-gsk4-sys-0.10.3
                                  rust-gtk4-0.10.3
                                  rust-gtk4-macros-0.10.3
                                  rust-gtk4-sys-0.10.3
                                  rust-gvdb-0.9.0
                                  rust-hashbrown-0.16.1
                                  rust-heck-0.5.0
                                  rust-hex-color-3.0.0
                                  rust-iana-time-zone-0.1.65
                                  rust-iana-time-zone-haiku-0.1.2
                                  rust-image-0.25.9
                                  rust-imgref-1.12.0
                                  rust-indexmap-2.13.0
                                  rust-is-terminal-polyfill-1.70.2
                                  rust-itertools-0.14.0
                                  rust-itoa-1.0.17
                                  rust-js-sys-0.3.85
                                  rust-keycode-1.0.0
                                  rust-keycode-macro-1.0.0
                                  rust-khronos-api-2.2.0
                                  rust-lazy-static-1.5.0
                                  rust-libadwaita-0.8.1
                                  rust-libadwaita-sys-0.8.1
                                  rust-libc-0.2.180
                                  rust-libloading-0.8.9
                                  rust-libloading-0.9.0
                                  rust-libm-0.2.16
                                  rust-lock-api-0.4.14
                                  rust-log-0.4.29
                                  rust-lru-0.16.3
                                  rust-memchr-2.7.6
                                  rust-memoffset-0.9.1
                                  rust-miniz-oxide-0.8.9
                                  rust-moxcms-0.7.11
                                  rust-num-traits-0.2.19
                                  rust-once-cell-1.21.3
                                  rust-once-cell-polyfill-1.70.2
                                  rust-pango-0.21.5
                                  rust-pango-sys-0.21.5
                                  rust-pin-project-lite-0.2.16
                                  rust-pin-utils-0.1.0
                                  rust-pkg-config-0.3.32
                                  rust-ppv-lite86-0.2.21
                                  rust-proc-macro-crate-3.4.0
                                  rust-proc-macro2-1.0.106
                                  rust-pxfm-0.1.27
                                  rust-quick-xml-0.38.4
                                  rust-quote-1.0.44
                                  rust-rand-0.8.5
                                  rust-rand-chacha-0.3.1
                                  rust-rand-core-0.6.4
                                  rust-relm4-0.10.1
                                  rust-relm4-css-0.10.1
                                  rust-relm4-icons-0.10.1
                                  rust-relm4-icons-build-0.10.1
                                  rust-relm4-macros-0.10.1
                                  rust-resource-0.6.1
                                  rust-resource-list-proc-macro-0.6.1
                                  rust-rgb-0.8.52
                                  rust-rustc-version-0.4.1
                                  rust-rustversion-1.0.22
                                  rust-rustybuzz-0.20.1
                                  rust-same-file-1.0.6
                                  rust-scopeguard-1.2.0
                                  rust-semver-1.0.27
                                  rust-serde-1.0.228
                                  rust-serde-core-1.0.228
                                  rust-serde-derive-1.0.228
                                  rust-serde-json-1.0.149
                                  rust-serde-spanned-1.0.4
                                  rust-shared-library-0.1.9
                                  rust-shlex-1.3.0
                                  rust-simd-adler32-0.3.8
                                  rust-slab-0.4.12
                                  rust-slotmap-1.1.1
                                  rust-smallvec-1.15.1
                                  rust-spin-0.9.8
                                  rust-strsim-0.11.1
                                  rust-syn-2.0.114
                                  rust-system-deps-7.0.7
                                  rust-target-lexicon-0.13.3
                                  rust-thiserror-2.0.18
                                  rust-thiserror-impl-2.0.18
                                  rust-tokio-1.49.0
                                  rust-toml-0.9.11+spec-1.1.0
                                  rust-toml-datetime-0.7.5+spec-1.1.0
                                  rust-toml-edit-0.23.10+spec-1.0.0
                                  rust-toml-parser-1.0.6+spec-1.1.0
                                  rust-toml-writer-1.0.6+spec-1.1.0
                                  rust-tracing-0.1.44
                                  rust-tracing-attributes-0.1.31
                                  rust-tracing-core-0.1.36
                                  rust-ttf-parser-0.25.1
                                  rust-unicode-bidi-0.3.18
                                  rust-unicode-bidi-mirroring-0.4.0
                                  rust-unicode-ccc-0.4.0
                                  rust-unicode-ident-1.0.22
                                  rust-unicode-properties-0.1.4
                                  rust-unicode-script-0.5.8
                                  rust-unicode-segmentation-1.12.0
                                  rust-utf8parse-0.2.2
                                  rust-version-compare-0.2.1
                                  rust-version-check-0.9.5
                                  rust-walkdir-2.5.0
                                  rust-wasi-0.11.1+wasi-snapshot-preview1
                                  rust-wasm-bindgen-0.2.108
                                  rust-wasm-bindgen-macro-0.2.108
                                  rust-wasm-bindgen-macro-support-0.2.108
                                  rust-wasm-bindgen-shared-0.2.108
                                  rust-web-sys-0.3.85
                                  rust-winapi-util-0.1.11
                                  rust-windows-core-0.62.2
                                  rust-windows-implement-0.60.2
                                  rust-windows-interface-0.59.3
                                  rust-windows-link-0.2.1
                                  rust-windows-result-0.4.1
                                  rust-windows-strings-0.5.1
                                  rust-windows-sys-0.61.2
                                  rust-winnow-0.7.14
                                  rust-xdg-3.0.0
                                  rust-xml-rs-0.7.0
                                  rust-yeslogic-fontconfig-sys-6.0.0
                                  rust-zerocopy-0.8.39
                                  rust-zerocopy-derive-0.8.39
                                  rust-zmij-1.0.19
                                  rust-zvariant-5.9.2
                                  rust-zvariant-derive-5.9.2
                                  rust-zvariant-utils-3.3.0))
                     (spotatui =>
                               (list rust-addr2line-0.25.1
                                     rust-adler2-2.0.1
                                     rust-aes-0.8.4
                                     rust-aho-corasick-1.1.4
                                     rust-allocator-api2-0.2.21
                                     rust-alsa-0.9.1
                                     rust-alsa-0.10.0
                                     rust-alsa-sys-0.3.1
                                     rust-android-system-properties-0.1.5
                                     rust-annotate-snippets-0.11.5
                                     rust-anstream-0.6.21
                                     rust-anstyle-1.0.13
                                     rust-anstyle-parse-0.2.7
                                     rust-anstyle-query-1.1.5
                                     rust-anstyle-wincon-3.0.11
                                     rust-anyhow-1.0.101
                                     rust-arbitrary-1.4.2
                                     rust-arboard-3.6.1
                                     rust-arrayvec-0.7.6
                                     rust-async-broadcast-0.7.2
                                     rust-async-channel-2.5.0
                                     rust-async-executor-1.13.3
                                     rust-async-io-2.6.0
                                     rust-async-lock-3.4.2
                                     rust-async-process-2.5.0
                                     rust-async-recursion-1.1.1
                                     rust-async-signal-0.2.13
                                     rust-async-stream-0.3.6
                                     rust-async-stream-impl-0.3.6
                                     rust-async-task-4.7.1
                                     rust-async-trait-0.1.89
                                     rust-atomic-waker-1.1.2
                                     rust-atomic-refcell-0.1.13
                                     rust-autocfg-1.5.0
                                     rust-backtrace-0.3.76
                                     rust-base64-0.22.1
                                     rust-base64ct-1.8.3
                                     rust-bindgen-0.72.1
                                     rust-bitflags-1.3.2
                                     rust-bitflags-2.10.0
                                     rust-block-buffer-0.10.4
                                     rust-block2-0.6.2
                                     rust-blocking-1.6.2
                                     rust-bumpalo-3.19.1
                                     rust-bytemuck-1.24.0
                                     rust-byteorder-1.5.0
                                     rust-byteorder-lite-0.1.0
                                     rust-bytes-1.11.1
                                     rust-castaway-0.2.4
                                     rust-cc-1.2.54
                                     rust-cesu8-1.1.0
                                     rust-cexpr-0.6.0
                                     rust-cfg-expr-0.20.6
                                     rust-cfg-if-1.0.4
                                     rust-cfg-aliases-0.2.1
                                     rust-chrono-0.4.43
                                     rust-cipher-0.4.4
                                     rust-clang-sys-1.8.1
                                     rust-clap-4.5.57
                                     rust-clap-builder-4.5.57
                                     rust-clap-complete-4.5.65
                                     rust-clap-lex-0.7.7
                                     rust-clipboard-win-5.4.1
                                     rust-colorchoice-1.0.4
                                     rust-colorgrad-0.8.0
                                     rust-combine-4.6.7
                                     rust-compact-str-0.9.0
                                     rust-concurrent-queue-2.5.0
                                     rust-console-0.15.11
                                     rust-const-oid-0.9.6
                                     rust-convert-case-0.8.0
                                     rust-convert-case-0.10.0
                                     rust-cookie-factory-0.3.3
                                     rust-core-foundation-0.9.4
                                     rust-core-foundation-0.10.1
                                     rust-core-foundation-sys-0.8.7
                                     rust-coreaudio-rs-0.13.0
                                     rust-cpal-0.16.0
                                     rust-cpal-0.17.1
                                     rust-cpufeatures-0.2.17
                                     rust-crc32fast-1.5.0
                                     rust-crossbeam-utils-0.8.21
                                     rust-crossterm-0.29.0
                                     rust-crossterm-winapi-0.9.1
                                     rust-crunchy-0.2.4
                                     rust-crypto-common-0.1.7
                                     rust-csscolorparser-0.8.1
                                     rust-ctr-0.9.2
                                     rust-curve25519-dalek-4.1.3
                                     rust-curve25519-dalek-derive-0.1.1
                                     rust-darling-0.20.11
                                     rust-darling-0.23.0
                                     rust-darling-core-0.20.11
                                     rust-darling-core-0.23.0
                                     rust-darling-macro-0.20.11
                                     rust-darling-macro-0.23.0
                                     rust-dasp-sample-0.11.0
                                     rust-data-encoding-2.10.0
                                     rust-der-0.7.10
                                     rust-deranged-0.5.5
                                     rust-derive-arbitrary-1.4.2
                                     rust-derive-builder-0.20.2
                                     rust-derive-builder-core-0.20.2
                                     rust-derive-builder-macro-0.20.2
                                     rust-derive-more-2.1.1
                                     rust-derive-more-impl-2.1.1
                                     rust-digest-0.10.7
                                     rust-dirs-6.0.0
                                     rust-dirs-sys-0.5.0
                                     rust-discord-rich-presence-1.1.0
                                     rust-dispatch2-0.3.0
                                     rust-displaydoc-0.2.5
                                     rust-document-features-0.2.12
                                     rust-dotenvy-0.15.7
                                     rust-ed25519-2.2.3
                                     rust-ed25519-dalek-2.2.0
                                     rust-either-1.15.0
                                     rust-encode-unicode-1.0.0
                                     rust-encoding-rs-0.8.35
                                     rust-endi-1.1.1
                                     rust-enum-dispatch-0.3.13
                                     rust-enumflags2-0.7.12
                                     rust-enumflags2-derive-0.7.12
                                     rust-equivalent-1.0.2
                                     rust-errno-0.3.14
                                     rust-error-code-3.3.2
                                     rust-event-listener-5.4.1
                                     rust-event-listener-strategy-0.5.4
                                     rust-fastrand-2.3.0
                                     rust-fax-0.2.6
                                     rust-fax-derive-0.2.0
                                     rust-fdeflate-0.3.7
                                     rust-fiat-crypto-0.2.9
                                     rust-filetime-0.2.27
                                     rust-find-msvc-tools-0.1.8
                                     rust-flate2-1.1.8
                                     rust-fnv-1.0.7
                                     rust-foldhash-0.2.0
                                     rust-foreign-types-0.3.2
                                     rust-foreign-types-shared-0.1.1
                                     rust-form-urlencoded-1.2.2
                                     rust-futures-0.3.31
                                     rust-futures-channel-0.3.31
                                     rust-futures-core-0.3.31
                                     rust-futures-executor-0.3.31
                                     rust-futures-io-0.3.31
                                     rust-futures-lite-2.6.1
                                     rust-futures-macro-0.3.31
                                     rust-futures-sink-0.3.31
                                     rust-futures-task-0.3.31
                                     rust-futures-timer-3.0.3
                                     rust-futures-util-0.3.31
                                     rust-generic-array-0.14.7
                                     rust-gethostname-1.1.0
                                     rust-getrandom-0.2.17
                                     rust-getrandom-0.3.4
                                     rust-gimli-0.32.3
                                     rust-gio-sys-0.21.5
                                     rust-glib-0.21.5
                                     rust-glib-macros-0.21.5
                                     rust-glib-sys-0.21.5
                                     rust-glob-0.3.3
                                     rust-gobject-sys-0.21.5
                                     rust-governor-0.10.4
                                     rust-gstreamer-0.24.4
                                     rust-gstreamer-app-0.24.4
                                     rust-gstreamer-app-sys-0.24.4
                                     rust-gstreamer-audio-0.24.4
                                     rust-gstreamer-audio-sys-0.24.4
                                     rust-gstreamer-base-0.24.4
                                     rust-gstreamer-base-sys-0.24.4
                                     rust-gstreamer-sys-0.24.4
                                     rust-h2-0.4.13
                                     rust-half-2.7.1
                                     rust-hashbrown-0.16.1
                                     rust-headers-0.4.1
                                     rust-headers-core-0.3.0
                                     rust-heck-0.5.0
                                     rust-hermit-abi-0.5.2
                                     rust-hex-0.4.3
                                     rust-hmac-0.12.1
                                     rust-home-0.5.12
                                     rust-http-1.4.0
                                     rust-http-body-1.0.1
                                     rust-http-body-util-0.1.3
                                     rust-httparse-1.10.1
                                     rust-httpdate-1.0.3
                                     rust-hyper-1.8.1
                                     rust-hyper-proxy2-0.1.0
                                     rust-hyper-rustls-0.27.7
                                     rust-hyper-tls-0.6.0
                                     rust-hyper-util-0.1.19
                                     rust-iana-time-zone-0.1.64
                                     rust-iana-time-zone-haiku-0.1.2
                                     rust-icu-collections-2.1.1
                                     rust-icu-locale-core-2.1.1
                                     rust-icu-normalizer-2.1.1
                                     rust-icu-normalizer-data-2.1.1
                                     rust-icu-properties-2.1.2
                                     rust-icu-properties-data-2.1.2
                                     rust-icu-provider-2.1.1
                                     rust-ident-case-1.0.1
                                     rust-idna-1.1.0
                                     rust-idna-adapter-1.2.1
                                     rust-image-0.25.9
                                     rust-indexmap-2.13.0
                                     rust-indicatif-0.17.11
                                     rust-indoc-2.0.7
                                     rust-inout-0.1.4
                                     rust-instability-0.3.11
                                     rust-ipnet-2.11.0
                                     rust-iri-string-0.7.10
                                     rust-is-docker-0.2.0
                                     rust-is-wsl-0.4.0
                                     rust-is-terminal-polyfill-1.70.2
                                     rust-itertools-0.13.0
                                     rust-itertools-0.14.0
                                     rust-itoa-1.0.17
                                     rust-jack-0.13.4
                                     rust-jack-sys-0.5.1
                                     rust-jni-0.21.1
                                     rust-jni-sys-0.3.0
                                     rust-js-sys-0.3.85
                                     rust-kasuari-0.4.11
                                     rust-kstring-2.0.2
                                     rust-lazy-static-1.5.0
                                     rust-libc-0.2.180
                                     rust-libloading-0.7.4
                                     rust-libloading-0.8.9
                                     rust-libm-0.2.15
                                     rust-libpulse-binding-2.30.1
                                     rust-libpulse-simple-binding-2.29.0
                                     rust-libpulse-simple-sys-1.22.0
                                     rust-libpulse-sys-1.23.0
                                     rust-libredox-0.1.12
                                     rust-librespot-audio-0.8.0
                                     rust-librespot-connect-0.8.0
                                     rust-librespot-core-0.8.0
                                     rust-librespot-metadata-0.8.0
                                     rust-librespot-oauth-0.8.0
                                     rust-librespot-playback-0.8.0
                                     rust-librespot-protocol-0.8.0
                                     rust-libspa-0.9.2
                                     rust-libspa-sys-0.9.2
                                     rust-line-clipping-0.3.5
                                     rust-linux-raw-sys-0.4.15
                                     rust-linux-raw-sys-0.11.0
                                     rust-litemap-0.8.1
                                     rust-litrs-1.0.0
                                     rust-lock-api-0.4.14
                                     rust-log-0.4.29
                                     rust-lru-0.16.3
                                     rust-lru-slab-0.1.2
                                     rust-mach2-0.4.3
                                     rust-mach2-0.5.0
                                     rust-maybe-async-0.2.10
                                     rust-memchr-2.7.6
                                     rust-memoffset-0.9.1
                                     rust-mime-0.3.17
                                     rust-minimal-lexical-0.2.1
                                     rust-miniz-oxide-0.8.9
                                     rust-mio-1.1.1
                                     rust-moxcms-0.7.11
                                     rust-mpris-server-0.9.0
                                     rust-muldiv-1.0.1
                                     rust-native-tls-0.2.14
                                     rust-ndk-0.9.0
                                     rust-ndk-context-0.1.1
                                     rust-ndk-sys-0.6.0+11769913
                                     rust-nix-0.30.1
                                     rust-nom-7.1.3
                                     rust-nom-8.0.0
                                     rust-nonzero-ext-0.3.0
                                     rust-ntapi-0.4.2
                                     rust-num-bigint-0.4.6
                                     rust-num-bigint-dig-0.8.6
                                     rust-num-complex-0.4.6
                                     rust-num-conv-0.2.0
                                     rust-num-derive-0.4.2
                                     rust-num-integer-0.1.46
                                     rust-num-iter-0.1.45
                                     rust-num-rational-0.4.2
                                     rust-num-traits-0.2.19
                                     rust-num-enum-0.7.5
                                     rust-num-enum-derive-0.7.5
                                     rust-num-threads-0.1.7
                                     rust-number-prefix-0.4.0
                                     rust-oauth2-5.0.0
                                     rust-objc2-0.6.3
                                     rust-objc2-app-kit-0.3.2
                                     rust-objc2-audio-toolbox-0.3.2
                                     rust-objc2-av-foundation-0.3.2
                                     rust-objc2-avf-audio-0.3.2
                                     rust-objc2-core-audio-0.3.2
                                     rust-objc2-core-audio-types-0.3.2
                                     rust-objc2-core-foundation-0.3.2
                                     rust-objc2-core-graphics-0.3.2
                                     rust-objc2-encode-4.1.0
                                     rust-objc2-foundation-0.3.2
                                     rust-objc2-io-kit-0.3.2
                                     rust-objc2-io-surface-0.3.2
                                     rust-objc2-media-player-0.3.2
                                     rust-object-0.37.3
                                     rust-once-cell-1.21.3
                                     rust-once-cell-polyfill-1.70.2
                                     rust-open-5.3.3
                                     rust-openssl-0.10.75
                                     rust-openssl-macros-0.1.1
                                     rust-openssl-probe-0.1.6
                                     rust-openssl-src-300.5.4+3.5.4
                                     rust-openssl-sys-0.9.111
                                     rust-option-ext-0.2.0
                                     rust-option-operations-0.6.1
                                     rust-ordered-stream-0.2.0
                                     rust-parking-2.2.1
                                     rust-parking-lot-0.12.5
                                     rust-parking-lot-core-0.9.12
                                     rust-pastey-0.2.1
                                     rust-pathdiff-0.2.3
                                     rust-pbkdf2-0.12.2
                                     rust-pem-rfc7468-0.7.0
                                     rust-percent-encoding-2.3.2
                                     rust-phf-0.13.1
                                     rust-phf-generator-0.13.1
                                     rust-phf-macros-0.13.1
                                     rust-phf-shared-0.13.1
                                     rust-pin-project-lite-0.2.16
                                     rust-pin-utils-0.1.0
                                     rust-piper-0.2.4
                                     rust-pipewire-0.9.2
                                     rust-pipewire-sys-0.9.2
                                     rust-pkcs1-0.7.5
                                     rust-pkcs8-0.10.2
                                     rust-pkg-config-0.3.32
                                     rust-png-0.18.0
                                     rust-polling-3.11.0
                                     rust-portable-atomic-1.13.0
                                     rust-portaudio-rs-0.3.2
                                     rust-portaudio-sys-0.1.1
                                     rust-potential-utf-0.1.4
                                     rust-powerfmt-0.2.0
                                     rust-ppv-lite86-0.2.21
                                     rust-primal-check-0.3.4
                                     rust-priority-queue-2.7.0
                                     rust-proc-macro-crate-3.4.0
                                     rust-proc-macro2-1.0.106
                                     rust-protobuf-3.7.2
                                     rust-protobuf-codegen-3.7.2
                                     rust-protobuf-json-mapping-3.7.2
                                     rust-protobuf-parse-3.7.2
                                     rust-protobuf-support-3.7.2
                                     rust-pxfm-0.1.27
                                     rust-quick-error-2.0.1
                                     rust-quick-xml-0.37.5
                                     rust-quick-xml-0.38.4
                                     rust-quinn-0.11.9
                                     rust-quinn-proto-0.11.13
                                     rust-quinn-udp-0.5.14
                                     rust-quote-1.0.44
                                     rust-r-efi-5.3.0
                                     rust-rand-0.8.5
                                     rust-rand-0.9.2
                                     rust-rand-chacha-0.3.1
                                     rust-rand-chacha-0.9.0
                                     rust-rand-core-0.6.4
                                     rust-rand-core-0.9.5
                                     rust-rand-distr-0.5.1
                                     rust-ratatui-0.30.0
                                     rust-ratatui-core-0.1.0
                                     rust-ratatui-crossterm-0.1.0
                                     rust-ratatui-widgets-0.3.0
                                     rust-realfft-3.5.0
                                     rust-redox-syscall-0.5.18
                                     rust-redox-syscall-0.7.0
                                     rust-redox-users-0.5.2
                                     rust-regex-1.12.2
                                     rust-regex-automata-0.4.13
                                     rust-regex-syntax-0.8.8
                                     rust-reqwest-0.12.28
                                     rust-ring-0.17.14
                                     rust-rodio-0.21.1
                                     rust-rsa-0.9.10
                                     rust-rspotify-0.14.0
                                     rust-rspotify-http-0.14.0
                                     rust-rspotify-macros-0.14.0
                                     rust-rspotify-model-0.14.0
                                     rust-rustc-demangle-0.1.27
                                     rust-rustc-hash-2.1.1
                                     rust-rustc-version-0.4.1
                                     rust-rustfft-6.4.1
                                     rust-rustix-0.38.44
                                     rust-rustix-1.1.3
                                     rust-rustls-0.23.36
                                     rust-rustls-pki-types-1.14.0
                                     rust-rustls-webpki-0.103.9
                                     rust-rustversion-1.0.22
                                     rust-ryu-1.0.22
                                     rust-same-file-1.0.6
                                     rust-schannel-0.1.28
                                     rust-scopeguard-1.2.0
                                     rust-sdl2-0.38.0
                                     rust-sdl2-sys-0.38.0
                                     rust-security-framework-2.11.1
                                     rust-security-framework-sys-2.15.0
                                     rust-self-replace-1.5.0
                                     rust-self-update-0.42.0
                                     rust-semver-1.0.27
                                     rust-serde-1.0.228
                                     rust-serde-core-1.0.228
                                     rust-serde-derive-1.0.228
                                     rust-serde-json-1.0.149
                                     rust-serde-path-to-error-0.1.20
                                     rust-serde-repr-0.1.20
                                     rust-serde-spanned-1.0.4
                                     rust-serde-urlencoded-0.7.1
                                     rust-serde-yaml-0.9.34+deprecated
                                     rust-sha1-0.10.6
                                     rust-sha2-0.10.9
                                     rust-shannon-0.2.0
                                     rust-shell-words-1.1.1
                                     rust-shlex-1.3.0
                                     rust-signal-hook-0.3.18
                                     rust-signal-hook-mio-0.2.5
                                     rust-signal-hook-registry-1.4.8
                                     rust-signature-2.2.0
                                     rust-simd-adler32-0.3.8
                                     rust-siphasher-1.0.1
                                     rust-slab-0.4.11
                                     rust-smallvec-1.15.1
                                     rust-socket2-0.6.2
                                     rust-spin-0.9.8
                                     rust-spinning-top-0.3.0
                                     rust-spki-0.7.3
                                     rust-stable-deref-trait-1.2.1
                                     rust-static-assertions-1.1.0
                                     rust-strength-reduce-0.2.4
                                     rust-strsim-0.11.1
                                     rust-strum-0.26.3
                                     rust-strum-0.27.2
                                     rust-strum-macros-0.26.4
                                     rust-strum-macros-0.27.2
                                     rust-subtle-2.6.1
                                     rust-symphonia-0.5.5
                                     rust-symphonia-bundle-flac-0.5.5
                                     rust-symphonia-bundle-mp3-0.5.5
                                     rust-symphonia-codec-vorbis-0.5.5
                                     rust-symphonia-core-0.5.5
                                     rust-symphonia-format-ogg-0.5.5
                                     rust-symphonia-metadata-0.5.5
                                     rust-symphonia-utils-xiph-0.5.5
                                     rust-syn-2.0.114
                                     rust-sync-wrapper-1.0.2
                                     rust-synstructure-0.13.2
                                     rust-sysinfo-0.36.1
                                     rust-system-configuration-0.6.1
                                     rust-system-configuration-sys-0.6.0
                                     rust-system-deps-7.0.7
                                     rust-tar-0.4.44
                                     rust-target-lexicon-0.13.3
                                     rust-tempfile-3.24.0
                                     rust-thiserror-1.0.69
                                     rust-thiserror-2.0.18
                                     rust-thiserror-impl-1.0.69
                                     rust-thiserror-impl-2.0.18
                                     rust-tiff-0.10.3
                                     rust-time-0.3.47
                                     rust-time-core-0.1.8
                                     rust-time-macros-0.2.27
                                     rust-tinystr-0.8.2
                                     rust-tinyvec-1.10.0
                                     rust-tinyvec-macros-0.1.1
                                     rust-tokio-1.49.0
                                     rust-tokio-macros-2.6.0
                                     rust-tokio-native-tls-0.3.1
                                     rust-tokio-rustls-0.26.4
                                     rust-tokio-stream-0.1.18
                                     rust-tokio-tungstenite-0.28.0
                                     rust-tokio-util-0.7.18
                                     rust-toml-0.9.11+spec-1.1.0
                                     rust-toml-datetime-0.7.5+spec-1.1.0
                                     rust-toml-edit-0.23.10+spec-1.0.0
                                     rust-toml-parser-1.0.6+spec-1.1.0
                                     rust-toml-writer-1.0.6+spec-1.1.0
                                     rust-tower-0.5.3
                                     rust-tower-http-0.6.8
                                     rust-tower-layer-0.3.3
                                     rust-tower-service-0.3.3
                                     rust-tracing-0.1.44
                                     rust-tracing-attributes-0.1.31
                                     rust-tracing-core-0.1.36
                                     rust-trait-variant-0.1.2
                                     rust-transpose-0.2.3
                                     rust-try-lock-0.2.5
                                     rust-tui-bar-graph-0.3.1
                                     rust-tui-equalizer-0.2.0-alpha
                                     rust-tungstenite-0.28.0
                                     rust-typenum-1.19.0
                                     rust-uds-windows-1.1.0
                                     rust-uncased-0.9.10
                                     rust-unicode-ident-1.0.22
                                     rust-unicode-segmentation-1.12.0
                                     rust-unicode-truncate-2.0.1
                                     rust-unicode-width-0.2.2
                                     rust-unsafe-libyaml-0.2.11
                                     rust-untrusted-0.9.0
                                     rust-url-2.5.8
                                     rust-urlencoding-2.1.3
                                     rust-utf-8-0.7.6
                                     rust-utf8-iter-1.0.4
                                     rust-utf8parse-0.2.2
                                     rust-uuid-0.8.2
                                     rust-uuid-1.19.0
                                     rust-vcpkg-0.2.15
                                     rust-vergen-9.0.6
                                     rust-vergen-gitcl-1.0.8
                                     rust-vergen-lib-0.1.6
                                     rust-vergen-lib-9.1.0
                                     rust-version-compare-0.1.1
                                     rust-version-compare-0.2.1
                                     rust-version-check-0.9.5
                                     rust-walkdir-2.5.0
                                     rust-want-0.3.1
                                     rust-wasi-0.11.1+wasi-snapshot-preview1
                                     rust-wasip2-1.0.2+wasi-0.2.9
                                     rust-wasm-bindgen-0.2.108
                                     rust-wasm-bindgen-futures-0.4.58
                                     rust-wasm-bindgen-macro-0.2.108
                                     rust-wasm-bindgen-macro-support-0.2.108
                                     rust-wasm-bindgen-shared-0.2.108
                                     rust-web-sys-0.3.85
                                     rust-web-time-1.1.0
                                     rust-webbrowser-1.0.6
                                     rust-webpki-roots-1.0.5
                                     rust-weezl-0.1.12
                                     rust-which-4.4.2
                                     rust-winapi-0.3.9
                                     rust-winapi-i686-pc-windows-gnu-0.4.0
                                     rust-winapi-util-0.1.11
                                     rust-winapi-x86-64-pc-windows-gnu-0.4.0
                                     rust-windows-0.54.0
                                     rust-windows-0.61.3
                                     rust-windows-0.62.2
                                     rust-windows-collections-0.2.0
                                     rust-windows-collections-0.3.2
                                     rust-windows-core-0.54.0
                                     rust-windows-core-0.61.2
                                     rust-windows-core-0.62.2
                                     rust-windows-future-0.2.1
                                     rust-windows-future-0.3.2
                                     rust-windows-implement-0.60.2
                                     rust-windows-interface-0.59.3
                                     rust-windows-link-0.1.3
                                     rust-windows-link-0.2.1
                                     rust-windows-numerics-0.2.0
                                     rust-windows-numerics-0.3.1
                                     rust-windows-registry-0.6.1
                                     rust-windows-result-0.1.2
                                     rust-windows-result-0.3.4
                                     rust-windows-result-0.4.1
                                     rust-windows-strings-0.4.2
                                     rust-windows-strings-0.5.1
                                     rust-windows-sys-0.45.0
                                     rust-windows-sys-0.52.0
                                     rust-windows-sys-0.59.0
                                     rust-windows-sys-0.60.2
                                     rust-windows-sys-0.61.2
                                     rust-windows-targets-0.42.2
                                     rust-windows-targets-0.52.6
                                     rust-windows-targets-0.53.5
                                     rust-windows-threading-0.1.0
                                     rust-windows-threading-0.2.1
                                     rust-windows-aarch64-gnullvm-0.42.2
                                     rust-windows-aarch64-gnullvm-0.52.6
                                     rust-windows-aarch64-gnullvm-0.53.1
                                     rust-windows-aarch64-msvc-0.42.2
                                     rust-windows-aarch64-msvc-0.52.6
                                     rust-windows-aarch64-msvc-0.53.1
                                     rust-windows-i686-gnu-0.42.2
                                     rust-windows-i686-gnu-0.52.6
                                     rust-windows-i686-gnu-0.53.1
                                     rust-windows-i686-gnullvm-0.52.6
                                     rust-windows-i686-gnullvm-0.53.1
                                     rust-windows-i686-msvc-0.42.2
                                     rust-windows-i686-msvc-0.52.6
                                     rust-windows-i686-msvc-0.53.1
                                     rust-windows-x86-64-gnu-0.42.2
                                     rust-windows-x86-64-gnu-0.52.6
                                     rust-windows-x86-64-gnu-0.53.1
                                     rust-windows-x86-64-gnullvm-0.42.2
                                     rust-windows-x86-64-gnullvm-0.52.6
                                     rust-windows-x86-64-gnullvm-0.53.1
                                     rust-windows-x86-64-msvc-0.42.2
                                     rust-windows-x86-64-msvc-0.52.6
                                     rust-windows-x86-64-msvc-0.53.1
                                     rust-winnow-0.7.14
                                     rust-wit-bindgen-0.51.0
                                     rust-writeable-0.6.2
                                     rust-x11rb-0.13.2
                                     rust-x11rb-protocol-0.13.2
                                     rust-xattr-1.6.1
                                     rust-yoke-0.8.1
                                     rust-yoke-derive-0.8.1
                                     rust-zbus-5.13.2
                                     rust-zbus-macros-5.13.2
                                     rust-zbus-names-4.3.1
                                     rust-zerocopy-0.8.33
                                     rust-zerocopy-derive-0.8.33
                                     rust-zerofrom-0.1.6
                                     rust-zerofrom-derive-0.1.6
                                     rust-zeroize-1.8.2
                                     rust-zerotrie-0.2.3
                                     rust-zerovec-0.11.5
                                     rust-zerovec-derive-0.11.2
                                     rust-zip-2.4.2
                                     rust-zipsign-api-0.1.5
                                     rust-zmij-1.0.16
                                     rust-zopfli-0.8.3
                                     rust-zune-core-0.4.12
                                     rust-zune-jpeg-0.4.21
                                     rust-zvariant-5.9.2
                                     rust-zvariant-derive-5.9.2
                                     rust-zvariant-utils-3.3.0))
                     (wayfreeze =>
                                (list rust-aho-corasick-1.1.4
                                      rust-anstream-0.6.21
                                      rust-anstyle-1.0.13
                                      rust-anstyle-parse-0.2.7
                                      rust-anstyle-query-1.1.5
                                      rust-anstyle-wincon-3.0.11
                                      rust-argparse-0.2.2
                                      rust-bitflags-2.10.0
                                      rust-cc-1.2.53
                                      rust-cfg-if-1.0.4
                                      rust-clap-4.5.54
                                      rust-clap-builder-4.5.54
                                      rust-clap-derive-4.5.49
                                      rust-clap-lex-0.7.7
                                      rust-colorchoice-1.0.4
                                      rust-downcast-rs-1.2.1
                                      rust-env-filter-0.1.4
                                      rust-env-logger-0.11.8
                                      rust-errno-0.3.14
                                      rust-fastrand-2.3.0
                                      rust-find-msvc-tools-0.1.8
                                      rust-getrandom-0.3.4
                                      rust-heck-0.5.0
                                      rust-is-terminal-polyfill-1.70.2
                                      rust-jiff-0.2.18
                                      rust-jiff-static-0.2.18
                                      rust-libc-0.2.180
                                      rust-linux-raw-sys-0.11.0
                                      rust-log-0.4.29
                                      rust-memchr-2.7.6
                                      rust-memmap2-0.8.0
                                      rust-once-cell-1.21.3
                                      rust-once-cell-polyfill-1.70.2
                                      rust-pkg-config-0.3.32
                                      rust-portable-atomic-1.13.0
                                      rust-portable-atomic-util-0.2.4
                                      rust-proc-macro2-1.0.105
                                      rust-quick-xml-0.38.4
                                      rust-quote-1.0.43
                                      rust-r-efi-5.3.0
                                      rust-regex-1.12.2
                                      rust-regex-automata-0.4.13
                                      rust-regex-syntax-0.8.8
                                      rust-rustix-1.1.3
                                      rust-serde-core-1.0.228
                                      rust-serde-derive-1.0.228
                                      rust-shlex-1.3.0
                                      rust-smallvec-1.15.1
                                      rust-strsim-0.11.1
                                      rust-syn-2.0.114
                                      rust-tempfile-3.24.0
                                      rust-unicode-ident-1.0.22
                                      rust-utf8parse-0.2.2
                                      rust-wasip2-1.0.2+wasi-0.2.9
                                      rust-wayland-backend-0.3.12
                                      rust-wayland-client-0.31.12
                                      rust-wayland-protocols-0.31.2
                                      rust-wayland-protocols-wlr-0.2.0
                                      rust-wayland-scanner-0.31.8
                                      rust-wayland-server-0.31.11
                                      rust-wayland-sys-0.31.8
                                      rust-windows-link-0.2.1
                                      rust-windows-sys-0.61.2
                                      rust-wit-bindgen-0.51.0
                                      rust-xkbcommon-0.7.0
                                      rust-xkeysym-0.2.1))
                     (wl-clip-persist =>
                                      (list rust-addr2line-0.24.2
                                       rust-adler2-2.0.1
                                       rust-aho-corasick-1.1.3
                                       rust-android-system-properties-0.1.5
                                       rust-anstream-0.6.20
                                       rust-anstyle-1.0.11
                                       rust-anstyle-parse-0.2.7
                                       rust-anstyle-query-1.1.4
                                       rust-anstyle-wincon-3.0.10
                                       rust-autocfg-1.5.0
                                       rust-backtrace-0.3.75
                                       rust-bit-set-0.8.0
                                       rust-bit-vec-0.8.0
                                       rust-bitflags-2.9.4
                                       rust-bumpalo-3.19.0
                                       rust-bytes-1.10.1
                                       rust-cc-1.2.38
                                       rust-cfg-if-1.0.3
                                       rust-chrono-0.4.42
                                       rust-clap-4.5.48
                                       rust-clap-builder-4.5.48
                                       rust-clap-derive-4.5.47
                                       rust-clap-lex-0.7.5
                                       rust-colorchoice-1.0.4
                                       rust-core-foundation-sys-0.8.7
                                       rust-env-filter-0.1.3
                                       rust-env-logger-0.11.8
                                       rust-fancy-regex-0.16.2
                                       rust-find-msvc-tools-0.1.2
                                       rust-futures-core-0.3.31
                                       rust-futures-macro-0.3.31
                                       rust-futures-sink-0.3.31
                                       rust-futures-task-0.3.31
                                       rust-futures-util-0.3.31
                                       rust-gimli-0.31.1
                                       rust-heck-0.5.0
                                       rust-iana-time-zone-0.1.64
                                       rust-iana-time-zone-haiku-0.1.2
                                       rust-io-uring-0.7.10
                                       rust-is-terminal-polyfill-1.70.1
                                       rust-js-sys-0.3.80
                                       rust-libc-0.2.176
                                       rust-log-0.4.28
                                       rust-memchr-2.7.5
                                       rust-miniz-oxide-0.8.9
                                       rust-mio-1.0.4
                                       rust-num-traits-0.2.19
                                       rust-object-0.36.7
                                       rust-once-cell-1.21.3
                                       rust-once-cell-polyfill-1.70.1
                                       rust-pin-project-lite-0.2.16
                                       rust-pin-utils-0.1.0
                                       rust-proc-macro2-1.0.101
                                       rust-quick-xml-0.37.5
                                       rust-quote-1.0.40
                                       rust-regex-1.11.2
                                       rust-regex-automata-0.4.10
                                       rust-regex-syntax-0.8.6
                                       rust-rustc-demangle-0.1.26
                                       rust-rustversion-1.0.22
                                       rust-shlex-1.3.0
                                       rust-signal-hook-registry-1.4.6
                                       rust-slab-0.4.11
                                       rust-socket2-0.6.0
                                       rust-strsim-0.11.1
                                       rust-syn-2.0.106
                                       rust-tokio-1.47.1
                                       rust-tokio-macros-2.5.0
                                       rust-tokio-pipe-0.2.12
                                       rust-tokio-util-0.7.16
                                       rust-unicode-ident-1.0.19
                                       rust-utf8parse-0.2.2
                                       rust-wasi-0.11.1+wasi-snapshot-preview1
                                       rust-wasm-bindgen-0.2.103
                                       rust-wasm-bindgen-backend-0.2.103
                                       rust-wasm-bindgen-macro-0.2.103
                                       rust-wasm-bindgen-macro-support-0.2.103
                                       rust-wasm-bindgen-shared-0.2.103
                                       rust-wayrs-client-1.3.1
                                       rust-wayrs-core-1.0.5
                                       rust-wayrs-proto-parser-3.0.1
                                       rust-wayrs-protocols-0.14.11+1.45
                                       rust-wayrs-scanner-0.15.4
                                       rust-windows-core-0.62.0
                                       rust-windows-implement-0.60.0
                                       rust-windows-interface-0.59.1
                                       rust-windows-link-0.1.3
                                       rust-windows-link-0.2.0
                                       rust-windows-result-0.4.0
                                       rust-windows-strings-0.5.0
                                       rust-windows-sys-0.59.0
                                       rust-windows-sys-0.60.2
                                       rust-windows-targets-0.52.6
                                       rust-windows-targets-0.53.3
                                       rust-windows-aarch64-gnullvm-0.52.6
                                       rust-windows-aarch64-gnullvm-0.53.0
                                       rust-windows-aarch64-msvc-0.52.6
                                       rust-windows-aarch64-msvc-0.53.0
                                       rust-windows-i686-gnu-0.52.6
                                       rust-windows-i686-gnu-0.53.0
                                       rust-windows-i686-gnullvm-0.52.6
                                       rust-windows-i686-gnullvm-0.53.0
                                       rust-windows-i686-msvc-0.52.6
                                       rust-windows-i686-msvc-0.53.0
                                       rust-windows-x86-64-gnu-0.52.6
                                       rust-windows-x86-64-gnu-0.53.0
                                       rust-windows-x86-64-gnullvm-0.52.6
                                       rust-windows-x86-64-gnullvm-0.53.0
                                       rust-windows-x86-64-msvc-0.52.6
                                       rust-windows-x86-64-msvc-0.53.0
                                       rust-zeroize-1.8.1)))
