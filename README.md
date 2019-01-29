# Brasic
Modify `sample.basic`

Basic/Assembly like language that compiles to Brainfuck written in [Bflat](https://github.com/fabrv/bf-interpreter#brainfuck-flat-bff--b). Probably the first high level brainfuck language written in a brainfuck derivative, most likely not.

Install NodeJS

```shell
npm i -g bfrun
bfrun start brasm.bf
```

## Making it work
This project was made as a proof of concept of [Bflat](https://github.com/fabrv/bf-interpreter#brainfuck-flat-bff--b) and not as a real fully-working compiler, so there are many bugs/errors that I didn't think are worth fixing. This errors make the compiler barely work, practically anything will brake the compiler.
So here are somethings to have in mind to make it work:
* Every command has to be written exactly as in the commands section.
* Your text editor must do "Return Carriage, New Line".
* Everyline has to have code.
* Tabs must be double-spaces.
* No trailing spaces after each line.
* Every command has to have a parameter.
* No trailing line after code.
* Strings (STR) must have opening and closing ""   
  
I'm sorry :/.
`sample.basic` has an example project; it is the 99 Bottles song, and a.bf is the compiled code.

## Commands
* **(LFT)** LEFT *number*
* **(RHT)** RIGHT *number*
* **(ADD)** ADD *number*
* **(SUB)** SUBSTRACT *number*
* **(WHL N)** WHILE NOT ZERO  
  * **(END WHL)** END
* **(PRT)** PRINT
* **(INP)** INPUT
* **(CPY)** COPY
* **(CLR)** CLEAR
* **(STR)** STRING