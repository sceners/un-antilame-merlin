# Unpacks files crypted with Anti-Lame Cryptor by P.S.A.

#### Written in November 1998.

[Original package](https://defacto2.net/f/a720a30)

```
╔═════════════╡ UN-ALC v0.1 ╞══╗
║  √ The Anti-Lame Unpacker    ║█
║  √ Full Sources Included     ║█
║  √ 100% Assembler Code       ║█
╟──────────────────────────────╢█
║ Copyright (c) 1998 by MERLiN ║█
║    Delirium Tremens Group    ║█
╚══════════════[ 01 Feb 1998 ]═╝█
  ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀

                             Un-alc v0.1
                             ===========
  ■ Unpacks files crypted with [Anti-Lame Cryptor by P.S.A.]
 
  ■ Usage: Un-Alc <encrypted_file>

  ■ Some TechInfo:
    I think there are two modifications of [Anti-Lame Cryptor by P.S.A.] -
  - for DUKELIST and for DOOMLIST, the difference between them is that
  the body of the main program starts at 000C3h in DUKELIST and at 000C2h
  in DOOMLIST cryptor. It RORs and XORs with static values - 03 and 0DFh.
  The author should use the timer port just to change those numbers. There 
  is no int 1 or int 3 usage, no DRx manipulations at all. So it was easy to
  write UN-ALC (UNAnti-Lame Cryptor).


                                                 (c) MERLiN 1998
                                                Delirium Tremens
```
