
## MOTIONS

- c pour supprimer mot !!!!! C pour supprimer toute la ligne a partir du curseur !!!

- [] pour trouver premiere paranthese ou accolade non fermee/ouverte
- () debut phrase current/precedent ou suivant
- {} empty line after paragraphe current/precedent ou suivant

- ia blocks !!!!!!!!
    > c2a[ suppr [[tout] [ca]]
    > yi( yank (l interieur de ces parentheses <3)
    > d2aw supprime le mot dans lequel le curseur est + white space qui le suit + pareil pour mot suivant
- . repeats last edit (either last sequence in insert mode, either last change eg 'dwi'

- H/L to go to first / last visible line on screen

- <count><pipe> eg '7|' to go to column 7

- / to search forward ? to search BACKWARD !
- / or ? <CR> to find last search

- in visual mode : g<C-a> to incremente all first number of each lines like :
        0
        0
        0
        0
        becomes
        1
        2 
        3 
        4

## COMMANDS
----------------------------------------------------------------------------------

inserer autour d'un pattern (avant et apres)

std::cout << "intArray = " << intArray << std::endl;
`:%s/<< "\([^"]*\)" <</<< _PURPLE & _END <</g`
--> std::cout << _PURPLE << "intArray = " << _END << intArray << std::endl;

----------------------------------------------------------------------------------

insert something btw two patterns
foo(bar) , blabla(fd)
`:%s-\(\w\+\)\(()\)-\1 \2-g`
--> foo (bar) , blabla (fd)

----------------------------------------------------------------------------------

replace all occurrences of foo but not foobla or vlafoofsd etc
`:%s/\<foo\>/bar/g`

----------------------------------------------------------------------------------

create an arg with the selected part and then use it with `\1`
`:s/\\(.*\\)/`

----------------------------------------------------------------------------------

replace all '(' without space before by ' ('
`:%s/\([^ ]\)(/\1 (/`


