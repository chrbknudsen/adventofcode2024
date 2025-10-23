# aoc 2017 day 18

# assembly.

# snd X plays a sound with a frequency equal to the value of X.
# set X Y sets register X to the value of Y.
# add X Y increases register X by the value of Y.
# mul X Y sets register X to the result of multiplying the value contained in register X by the value of Y.
# mod X Y sets register X to the remainder of dividing the value contained in register X by the value of Y (that is, it sets X to the result of X modulo Y).
# rcv X recovers the frequency of the last sound played, but only when the value of X is not zero. (If it is zero, the command does nothing.)
# jgz X Y jumps with an offset of the value of Y, but only if the value of X is greater than zero. (An offset of 2 skips the next instruction, an offset of -1 jumps to the previous instruction, and so on.)


example <- c("set a 1",
"add a 2",
"mul a a",
"mod a 5",
"snd a",
"set a 0",
"rcv a",
"jgz a -1",
"set a 1",
"jgz a -2")



input <- strsplit(trimws(example), " ")
instructions <- vapply(input, "[[", "", 1)
register <- vapply(input, function(z) z[2], "")
value <- vapply(input, function(z) z[3], "")

# hm. Vi skal kunne håndtere at value ikke er en value, men indholdet af 
# et register...

# Så.

return_value <- function(input){
  if(input %in% names(registers)){
    registers[input]
  }else{
    as.numeric(input)
  }
}
#Så laver vi en navngiven vektor eller noget, hvor vi håndterer registrene.


registers <- rep(0, length(unique(register)))
names(registers) <- unique(register)


# Nu har vi registers, vi har en vektor med instrukser, en tilhørende register
# der skal opereres på. Og en value der skal gøres noget ved.


pointer <- 1

while(pointer >0 && pointer <= length(instructions)){
  operation <- instructions[pointer]
  switch(operation,
    "set" = {registers[[register[pointer]]] <- return_value(value[pointer]);pointer <- pointer + 1 ; print("SET"); print(pointer)},
    "add" = {registers[[register[pointer]]] <- registers[[register[pointer]]] + return_value(value[pointer]) ;pointer <- pointer + 1; print("ADD"); print(pointer)},
    "mul" = {registers[[register[pointer]]] <- registers[[register[pointer]]]*return_value(value[pointer]) ;pointer <- pointer + 1; print(MUL)},
    "mod" = {registers[[register[pointer]]] <- registers[[register[pointer]]]%%return_value(value[pointer]); pointer <- pointer + 1},
    "snd" = {sound <- registers[[register[pointer]]]; pointer <- pointer + 1},
    "rcv" = {if(registers[[register[pointer]]]!=0){last_sound_played <- sound; pointer <- -100; print("STOP")}},
    "jgz" = {if(registers[[register[pointer]]]>0){pointer <- pointer + return_value(value[pointer])}; print("JGZ"); print(pointer)},
    stop("Ukendt opcode: ", operation)

  )
#  pointer <- pointer + 1
  
}

registers
sound
# last_sound_played
# snd X plays a sound with a frequency equal to the value of X.
## set X Y sets register X to the value of Y.
## add X Y increases register X by the value of Y.
## mul X Y sets register X to the result of multiplying the value contained in register X by the value of Y.
## mod X Y sets register X to the remainder of dividing the value contained in register X by the value of Y (that is, it sets X to the result of X modulo Y).
## rcv X recovers the frequency of the last sound played, but only when the value of X is not zero. 
## (If it is zero, the command does nothing.)
# jgz X Y jumps with an offset of the value of Y, but only if the value of X is greater than zero. 
# (An offset of 2 skips the next instruction, an offset of -1 jumps to the previous instruction, and so on.)
