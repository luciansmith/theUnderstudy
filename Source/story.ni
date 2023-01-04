"The Understudy: name_of_play" by someone, from a seed by Lucian Smith

[Hello, author!  The mechanical premise of this game is that the PC is the protagonist in a play, and can advance the story either in-character or out-of-character.  It's up to you whether you want to allow a complete play-through using only one type of actions, or whether some solutions might require being in-character (IC) and some solutions require being out-of-character (OOC).  Both could be fun!  If I was doing this myself, I think I'd make an easier path that used both, and perhaps then try to introduce harder puzzle solutions that used the other, so you could do either one or the other.  Maybe you could make OOC solutions easier, and IC solutions harder in general!

In my version of the *story* premise of the game, the PC is an understudy for an actor that never gets sick, so they skived off actually learning any of their lines.  Then the actor actually *did* get sick, so the PC is winging it based on their extensive knowledge of theater, an uncanny ability to really throw themselves into a character, the good graces of their fellow actors, and a complete lack of knowledge of their lines.]

The story headline is "An Interactive Winging It"

After printing the banner text, say "Type 'about' for more information."

Part 0 - The code's backstage

Use American dialect, the serial comma, and full-length room descriptions.

[The trick to this is that everything needs two descriptions: one OOC, and one IC:]

A thing has a text called ooc_desc.  The ooc_desc of a thing is usually "BUG:  no out of character description set."

A thing has a text called ic_desc.  The ic_desc of a thing is usually "BUG:  no in-character description set."
[Alt:  'you see nothing special about [the thing].']

A room has a text called ooc_desc.  The ooc_desc of a room is usually "BUG:  no out of character description set."

A room has a text called ic_desc.  The ic_desc of a room is usually "BUG:  no in-character description set."
[Alt:  'you see nothing special about [the room].']

character is a backdrop which is everywhere.  The ooc_desc of character is "The character you're portraying is FILL_THIS_IN.  To really embody that character for the audience, type ENTER CHARACTER.  To return to your acting self, you can BREAK CHARACTER or EXIT CHARACTER."  The ic_desc of character is "You are FILL_THIS_IN... though at some level, you still remember that you're just portraying them.  To return to your acting self, you can BREAK CHARACTER or EXIT CHARACTER.  To become FILL_THIS_IN again, you can ENTER CHARACTER."

character can be IN or OUT.  Character is OUT.

instead of entering character:
	now character is IN;
	say "You enter the character of FILL_THIS_IN and become them more fully.";
	try looking.

instead of attacking character:
	now character is OUT;
	say "With a long blink, you extricate yourself mentally from FILL_THIS_IN so you can look at your actual surroundings a bit better.";
	try looking.

OOC is a recurring  scene.  OOC begins when play begins.  OOC begins when character is OUT.  OOC ends when character is IN.  

IC is a recurring  scene.  IC begins when character is IN. IC ends when character is OUT.

[Thanks to climbingstars at https://intfiction.org/t/inform-7-altering-room-descriptions-on-the-fly-solved/4578/11 for the following:]
The standard examining rule is not listed in the carry out examining rulebook.
The examine directions rule is not listed in the carry out examining rulebook.
The examine containers rule is not listed in the carry out examining rulebook.
The examine supporters rule is not listed in the carry out examining rulebook.
The examine devices rule is not listed in the carry out examining rulebook.
The examine undescribed things rule is not listed in the carry out examining rulebook.

Printing the description of something is an activity.

Last for printing the description of a something (called the chosen item) (this is the default item description printing rule):
	if OOC is happening: 
		say the ooc_desc of the chosen item; 
		say line break;
	otherwise: 
		say the ic_desc of the chosen item; 
		say line break;


Last for printing the description of a room (called the chosen room) (this is the default room description printing rule):
	if character is OUT: 
		[Can't use scenes here or the change character "look" action won't work:]
		say the ooc_desc of the chosen room; 
		say line break;
	otherwise: 
		say the ic_desc of the chosen room; 
		say line break;

Last for printing the description of a dark room (this is the default dark room description printing rule): say “It is pitch dark, and you can’t see a thing.”.

Carry out examining (this is the fancy examining rule): carry out the printing the description activity with the noun.

Carry out looking (this is the improved room description body text rule):
	if in darkness begin;
		carry out the printing the description of a dark room activity;
	otherwise;
		carry out the printing the description activity with the visibility ceiling;
	end if.


Part 1 - The opening stage

stage1 is a room. The ooc_desc of stage1 is "It's a stage."  The ic_desc of stage1 is "A lovely pasture."


a box is a container in stage1.  It is enterable.