sample.basic!
^>+++++[<+++++++++>-]<+++      REG CELL 0 48 '0'
[>+>+<<-]>>[<<+>>-]            COPY CELL 0 TO CELL 1
++++[<++++>-]<+                ADD 17 TO CELL 1
[>+>+<<-]>>[<<+>>-]            COPY CELL 1 TO CELL 2
+++++[<++++++>-]<++            ADD 32 TO CELL 2
>
[
  Register cell values: [48,65,97]
  R(0) = Start of UNICODE numbers
  R(1) = Start of UNICODE capital letters
  R(2) = Start of UNICODE small letters
]
>++++++++++++
^>^[^,>^-]                     GET ALL INPUT TO MEMORY
^<[<]>#                        MOVE TO BEGGINING OF MEMORY AND READ FILE
[>]<[[-]<]>                    CLEAR MEMORY AND RETURN TO CELL 1

[WRITE 'a.bf']

^<<[>+>+<<-]>>[<<+>>-]         COPY REG CELL 2 TO 3
<[^+^-]                        MOVE REG CELL 3 TO MEM CELL 1

<<<[>>>+>+<<<<-]>>>[<<<+>>>-]  COPY REG CELL 0 TO 4
++[>-<-]>                      SUBSTRACT 2 FROM REG 4
^>^[^+^-]                      MOVE REG 4 TO MEM 2

<<[>+>+<<-]>[<+>-]>+           COPY REG CELL 2 TO 4 AND ADD 1
^>^[^+^-]                      MOVE REG 4 TO MEM 3

<<[>+>+<<-]>[<+>-]>+++++       COPY REG CELL 2 TO 4 AND ADD 5
^>^[^+^-]                      MOVE REG 4 TO MEM 4

^[<]>::                        MOVE TO BEGGINING OF MEMORY AND CREATE FILE
[>]>>>                         MOVE TO END OF MEMORY


[Load asm file to memory without new lines, character returns and tabs]
^>++++[<+++>-]<+>>+++++[<++>-]^
>,[
  [>+>+<<-]>>[<<+>>-]
  >++++[<++++++++>-]
  <[<->-]<                     SUBSTRACT 32 FROM INPUT
  >+<[>-<[-]]>[                IF (X == 32){
    -
    <<<[>>+>+<<<-]              COPY FIRST NUMBER
    >>>[<<<+>>>-]
    >++++[<++++++++>-]
    <[<->-]<                     SUBSTRACT 32 FROM FIRST NUMBER
    >+<[>-<[-]]>[                  IF (X == 32){
      -
      <<[[-]<]>>
    ]                              }
  ]<<                          }

  [^+>+<^-]^[^+^-]             COPY INPUT TO MEM 7
  >[>+>+<<-]>>[<<+>>-]         COPY MEM CELL 7 TO 8
  
  <<<<<[                       MOVE TO MEM CELL 4
    [>>>->>+<<<<<-]
    >>>>>[<<<<<+>>>>>-]        SUBSTRACT 13 OR 10 FROM INPUT

    <<<+>[<->[-]]              IF (x == 0)
    <[^[-]^ -]                   CLEAR INPUT CHAR FROM MEM
    <                          MOVE TO REG CELL 5
  ]
  ^>,
]
^<[[-]<]<^                     CLEAR 10 AND 13 FROM REG
<[[<]<<]                       MOVE TO START OF MEM


[(1)*2+(2)-(3)]
>>>
[
  [<++>-]<[>+<-]>              MULTIPLY POS 1 BY 2
  >>[<<->>-]+                  SUBSTRACT POS 3 OF POS 1 AND LEAVE 1 IN MEMORY
  <[<+>-]+                     ADD POS 2 TO 1 AND LEAVE 1 IN MEMORY

  ^>>^
  >>>[^+^-]                    MOVE POS 5 TO REG 4
  ^<<<<[>>>>->+<<<<<-]         SUBSTRACT 48 FROM REG 4
  >>>>>[<<<<<+>>>>>-]          MOVE REG 5 TO REG 0
  <[^+^-]<<^                   MOVE REG 4 TO POS 5
  
  [>]>>                        MOVE TO NEXT OPCODE
]

<<<[[<]<<]                     MOVE TO START OF MEMORY


[Start of reading and compiling]
>>>^>>^
--------------------------------
[  
++++++++++++++++++++++++++++++++

[^+>+<^-]^>[^+^-]<             COPY POS 1 TO REG 4
[>+>+<<-]>>[<<+>>-]            COPY REG 4 TO 5

IF 'LFT'
>++++++[<+++++++++++++++++++++++>-] [REG 4: 138]
<[<->-]<                       SUBSTRACT 128 FROM OPCODE
>+<[>-<[-]]>[                  IF (X == 128){  
  -^>>>>                         MOVE TO POS 5
  [^+^-]^                        MOVE POS 5 TO REG 6
  >>++++++[<++++++++++>-]        ['<' TO REG 7]
  <<^>>>
  [
    [>]>>                        MOVE TO END OF MEMORY
  ]++++++++++++++++++++++++++++++++>
  ADD 32
  ^[>[>+^+^<-]>[<+>-]^>^<<-]     [WRITE '<' N TIMES]
  >[-]<                          [CLEAR '<' IN REGISTER]
]                              }

<<[>+>+<<-]>>[<<+>>-]          COPY REG 4 TO 5

IF 'RHT'
>++++++++[<+++++++++++++++++++>-] [REG 4: 152]
<[<->-]<                       SUBSTRACT 152 FROM OPCODE
>+<[>-<[-]]>[                  IF (X == 152){  
  -^>>>>                         MOVE TO POS 5
  [^+^-]^                        MOVE POS 5 TO REG 6
  >>++++++[<++++++++++>-]<++>    ['>' TO REG 7]
  <<^>>>
  [
    [>]>>                        MOVE TO END OF MEMORY
  ]++++++++++++++++++++++++++++++++>ADD 32
  ^[>[>+^+^<-]>[<+>-]^>^<<-]     [WRITE '>' N TIMES]
  >[-]<                          [CLEAR '>' IN REGISTER]
]                              }

<<[>+>+<<-]>>[<<+>>-]          COPY REG 4 TO 5

IF 'ADD'
>++++++++++[<+++++++++++++>-]  [REG 4: 130]
<[<->-]<                       SUBSTRACT 130 FROM OPCODE
>+<[>-<[-]]>[                  IF (X == 130){
  -^>>>>                         MOVE TO POS 5
  [^+^-]^                        MOVE POS 5 TO REG 6
  >>++++++[<+++++++>-]<+>        ['+' TO REG 7]
  <<^>>>
  [
    [>]>>                        MOVE TO END OF MEMORY
  ]++++++++++++++++++++++++++++++++>
  ADD 32
  ^[>[>+^+^<-]>[<+>-]^>^<<-]     [WRITE '+' N TIMES]
  >[-]<                          [CLEAR '+' IN REGISTER]
]                              }

<<[>+>+<<-]>>[<<+>>-]          COPY REG 4 TO 5

IF 'SUB'
>++++++++[<+++++++++++++++++++++++>-]<+> [REG 4: 185]
<[<->-]<                       SUBSTRACT 185 FROM OPCODE
>+<[>-<[-]]>[                  IF (X == 185){
  -^>>>>                         MOVE TO POS 5
  [^+^-]^                        MOVE POS 5 TO REG 6
  >>++++++[<+++++++>-]<+++>      ['-' TO REG 7]
  <<^>>>
  [
    [>]>>                        MOVE TO END OF MEMORY
  ]++++++++++++++++++++++++++++++++>
  ADD 32
  ^[>[>+^+^<-]>[<+>-]^>^<<-]     [WRITE '-' N TIMES]
  >[-]<                          [CLEAR '-' IN REGISTER]
]                              }

<<[>+>+<<-]>>[<<+>>-]          COPY REG 4 TO 5

IF 'WHL'
>++++++++++[<+++++++++++++++++>-] [REG 4: 170]

<[<->-]<                       SUBSTRACT 170 FROM OPCODE
>+<[>-<[-]]>[                  IF (X == 170){
  -^[>]<[-]                      CLEAR LAST POS
  >>>[[>]>>]                     MOVE TO END OF MEM
  ++++++++++++++++++++++++++++++++>ADD 32
  
  >+++++++++[<++++++++++>-]<+    MEM CELL = 91
  ^
]                             }

<<[>+>+<<-]>>[<<+>>-]          COPY REG 4 TO 5

IF 'END'
>++++++++++[<+++++++++++++++>-]<--> [REG 4: 148]

<[<->-]<                       SUBSTRACT 148 FROM OPCODE
>+<[>-<[-]]>[                  IF (X == 148){
  -^[>]<[-]                      CLEAR LAST POS
  >>>[[>]>>]                     MOVE TO END OF MEM
  ++++++++++++++++++++++++++++++++>ADD 32
  
  >+++++++++[<++++++++++>-]<+++    MEM CELL = 93
  ^
]                             }

<<[>+>+<<-]>>[<<+>>-]          COPY REG 4 TO 5

IF 'INP'
>++++++++++[<++++++++++++++>-]<++++> [REG 4: 144]
<[<->-]<                       SUBSTRACT 144 FROM OPCODE
>+<[>-<[-]]>[                  IF (X == 144){
  -^>>>>                         MOVE TO POS 5
  [^+^-]^                        MOVE POS 5 TO REG 6
  >>+++++[<+++++++++>-]<->       [',' TO REG 7]
  <<^>>>
  [
    [>]>>                        MOVE TO END OF MEMORY
  ]++++++++++++++++++++++++++++++++>
  ADD 32

  ^[
    >[>+^+^<-]
    >[<+>-]

    >
    ++++++[<++++++++++>-]<++>    ['>' TO REG 8]
    ^>^<[^+^-]

    ^>^<<-
  ]                              [WRITE ',>' N TIMES]
  ^>++++++[<++++++++++>-]^       ['<' TO REG 7]
  >[-]<                          [CLEAR ',' IN REGISTER]
]                              }

<<[>+>+<<-]>>[<<+>>-]          COPY REG 4 TO 5

IF 'PRT'
>++++++++++[<+++++++++++++++>-]<++++++++> [REG 4: 158]

<[<->-]<                       SUBSTRACT 158 FROM OPCODE
>+<[>-<[-]]>[                  IF (X == 158){
  -
  ^>>>>
  [^+>+<^-]                      MOVE VALUE TO COMPARE TO REG
  
  ^>>+++++++++++++++++++         ADD 19 TO REG
  [<->-]<
  >+<[>-<[-]]>[                  IF (X == 19){
    -^[-]>>>[[>]>>]               [WRITE ' .']
    ++++++++++++++++++++++++++++++++>
    ++++++++++++++++++++++++++++++++++++++++++++++>^
  ]                              }
  
  <<[>+>+<<-]>>[<<+>>-]          COPY VALUE TO COMPARE
  +++++++++++++++++++++++++      ADD 25 TO REG
  
  [<->-]<
  >+<[>-<[-]]>[                  IF (X == 25){
    -^[-]>>>[[>]>>]                [WRITE '48(+).']
    ++++++++++++++++++++++++++++++++>
    ^++++++++++++++++++++++++++++++++++++++++++++++++
    [                              PRINT 43 48 TIMES
      ^+++++++++++++++++++++++++++++++++++++++++++>
      ^-
    ]                              [PRINT '.']
    ^++++++++++++++++++++++++++++++++++++++++++++++>^
  ]                              }

  <<[>+>+<<-]>>[<<+>>-]          COPY VALUE TO COMPARE
  ++++++++++++++++++++++++++++   ADD 28 TO REG

  [<->-]<
  >+<[>-<[-]]>[                  IF (X == 28){
    -^[-]>>>[[>]>>]               [WRITE ' [.>]']
    ++++++++++++++++++++++++++++++++>
    >+++++++++[<++++++++++>-]<+>
    ++++++++++++++++++++++++++++++++++++++++++++++>
    >++++++[<++++++++++>-]<++>
    >+++++++++[<++++++++++>-]<+++>^
  ]

  <<[-]
]                              }

<<[>+>+<<-]>>[<<+>>-]          COPY REG 4 TO 5

IF 'STR'
>++++++++++[<++++++++++++++++>-]<++++++++> [REG 4: 168]

<[<->-]<                       SUBSTRACT 168 FROM OPCODE
>+<[>-<[-]]>[                  IF (X == 168){
  -
  ^
  >[[>]>>]                       MOVE TO END OF MEM
  ++++++++++++++++++++++++++++++++> ADD SPACE
  >+++++++++[<++++++++++>-]<+>   ADD OPEN LOOP
  >++++++[<+++++++>-]<+++>       ADD MINUS
  >+++++++++[<++++++++++>-]<+++> ADD CLOSE LOOP
  >++++++[<++++++++++>-]<++>     ADD RIGHT MOVEMENT
  <[[<]<<]>>>
  >>>>>                          MOVE TO CHAR AFTER "
  ----------------------------------
  [
    ++++++++++++++++++++++++++++++++++
    [^+^-]                         MOVE VAL TO REG
    >[[>]>>]<<                     MOVE TO END OF MEM
    ^[                             ADD PLUS N TIMES
      ^+++++++++++++++++++++++++++++++++++++++++++>
      ^-
    ]
    ^>++++++[<++++++++++>-]<++>    ADD RIGHT MOVEMENT
    >+++++++++[<++++++++++>-]<+>   ADD OPEN LOOP
    >++++++[<+++++++>-]<+++>       ADD MINUS
    >+++++++++[<++++++++++>-]<+++> ADD CLOSE LOOP
    
    <[[<]<<]>>>[>]+>
    ----------------------------------
  ]
  >>>[[>]>>]<<
  >++++++[<++++++++++>-]         ADD LEFT MOVEMENT
  >+++++++++[<++++++++++>-]<+>   ADD OPEN LOOP
  >++++++[<++++++++++>-]         ADD LEFT MOVEMENT
  >+++++++++[<++++++++++>-]<+++> ADD CLOSE LOOP
  >++++++[<++++++++++>-]<++>     ADD RIGHT MOVEMENT
  ^
]

<<[>+>+<<-]>>[<<+>>-]          COPY REG 4 TO 5

IF 'CLR'
>++++++++++[<+++++++++++++>-]<--> [REG 4: 128]

<[<->-]<                       SUBSTRACT 128 FROM OPCODE
>+<[>-<[-]]>[                  IF (X == 128){
  -^>>>>
  [^+^-]                         MOVE VAL TO REG
  >>>[[>]>>]                       MOVE TO END OF MEM
  ++++++++++++++++++++++++++++++++> ADD SPACE
  ^[>+>+<<-]>>[<<+>>-]
  +++++++++++++++++++
  [<->-]<
  >+<[>-<[-]]>[                  IF (X == 19){
    ^>+++++++++[<++++++++++>-]<+>  ADD OPEN LOOP
    >++++++[<+++++++>-]<+++>       ADD MINUS
    >+++++++++[<++++++++++>-]<+++> ADD CLOSE LOOP
    ^-
  ]
  <<[>+>+<<-]>>[<<+>>-]
  ++++++++++++++++++++++++++++
  [<->-]<
  >+<[>-<[-]]>[                  IF (X == 28){
    ^>+++++++++[<++++++++++>-]<+>  ADD OPEN LOOP
    >+++++++++[<++++++++++>-]<+>   ADD OPEN LOOP
    >++++++[<+++++++>-]<+++>       ADD MINUS
    >+++++++++[<++++++++++>-]<+++> ADD CLOSE LOOP
    >++++++[<++++++++++>-]<++>     ADD RIGHT MOVEMENT
    >+++++++++[<++++++++++>-]<+++> ADD CLOSE LOOP
    ^-
  ]
  <<[-]
]                             }

<<[>+>+<<-]>>[<<+>>-]          COPY REG 4 TO 5

IF 'CPY'
>++++++++++[<+++++++++++++>-]<-----> [REG 4: 125]
<[<->-]<                       SUBSTRACT 125 FROM OPCODE
>+<[>-<[-]]>[                  IF (X == 125){
  -^>>>>
  [^+^-]                         MOVE VAL TO REG
  >>>1[[>]>>]                    MOVE TO END OF MEM
  ++++++++++++++++++++++++++++++++> ADD SPACE
  ^[
    ^
    >+++++++++[<++++++++++>-]<+>   ADD OPEN LOOP
    >++++++[<++++++++++>-]<++>     ADD RIGHT MOVEMENT
    >++++++[<+++++++>-]<+>         ADD PLUS
    >++++++[<++++++++++>-]<++>     ADD RIGHT MOVEMENT
    >++++++[<+++++++>-]<+>         ADD PLUS
    >++++++[<++++++++++>-]         ADD LEFT MOVEMENT
    >++++++[<++++++++++>-]         ADD LEFT MOVEMENT
    >++++++[<+++++++>-]<+++>       ADD MINUS
    >+++++++++[<++++++++++>-]<+++> ADD CLOSE LOOP
    
    >++++++[<++++++++++>-]<++>     ADD RIGHT MOVEMENT
    >++++++[<++++++++++>-]<++>     ADD RIGHT MOVEMENT
    >+++++++++[<++++++++++>-]<+>   ADD OPEN LOOP
    >++++++[<++++++++++>-]         ADD LEFT MOVEMENT
    >++++++[<++++++++++>-]         ADD LEFT MOVEMENT
    >++++++[<+++++++>-]<+>         ADD PLUS
    >++++++[<++++++++++>-]<++>     ADD RIGHT MOVEMENT
    >++++++[<++++++++++>-]<++>     ADD RIGHT MOVEMENT
    >++++++[<+++++++>-]<+++>       ADD MINUS
    >+++++++++[<++++++++++>-]<+++> ADD CLOSE LOOP
    >++++++[<++++++++++>-]         ADD LEFT MOVEMENT
    ^-
  ]
]                             }

[-----OPCODES ABOVE THIS-----]

<<[-]
^<[[<]<<]>>>
--------------------------------
]
<<<<
[[<>[-]<]<<<]
<[<]>: