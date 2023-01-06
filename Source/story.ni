"The Understudy: name_of_play" by someone, from a seed by Lucian Smith

[Hello, author!  The mechanical premise of this game is that the PC is the protagonist in a play, and can advance the story either in-character or out-of-character.  It's up to you whether you want to allow a complete play-through using only one type of actions, or whether some solutions might require being in-character (IC) and some solutions require being out-of-character (OOC).  Both could be fun!  If I was doing this myself, I think I'd make an easier path that used both, and perhaps then try to introduce harder puzzle solutions that used the other, so you could do either one or the other.  Maybe you could make OOC solutions easier, and IC solutions harder in general!

In my version of the *story* premise of the game, the PC is an understudy for an actor that never gets sick, so they skived off actually learning any of their lines.  Then the actor actually *did* get sick, so the PC is winging it based on their extensive knowledge of theater, an uncanny ability to really throw themselves into a character, the good graces of their fellow actors, and a complete lack of knowledge of their lines.

In case it needs to be said:  feel free to use ANYTHING in this you find inspiring and IGNORE anything you don't.  There's no need to actually use this code or even to use Inform, if you don't need it.  

If you do use Inform, feel free to fork the project from https://github.com/luciansmith/theUnderstudy.inform  I'm also happy to work with you if you like, particulary if something I've coded doesn't work the way you want, or if you'd like a different effect somewhere and are unsure how to accomplish it.  My Inform is a bit rusty, but I'm game to try.]

The story headline is "An Interactive Winging It"

After printing the banner text, say "Remember:  you can ENTER CHARACTER or BREAK CHARACTER at any time."

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

OOC is a recurring  scene.  OOC begins when play begins.  OOC begins when character is OUT.  OOC ends when character is IN.  

IC is a recurring  scene.  IC begins when character is IN. IC ends when character is OUT.

instead of examining the yourself, try examining character.

instead of entering character:
	if character is IN:
		say "You're already as into character as you can get.";
	otherwise:
		now character is IN;
		say "You enter the character of FILL_THIS_IN and become them more fully.";
		try looking.

instead of attacking character:
	if character is OUT:
		say "You're already out of character.";
	otherwise:
		now character is OUT;
		say "With a long blink, you extricate yourself mentally from FILL_THIS_IN so you can look at your actual surroundings a bit better.";
		try looking.

Exiting from is an action applying to one thing.

Understand "exit [something]" as exiting from.

Check exiting from:
	if the noun does not enclose the player, say "That doesn't seem to be something you're in at the moment." instead.

Carry out exiting from:
	try exiting.
	
Instead of exiting from character:
	try attacking character

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

[Something about this is broken, because it prints the room contents before the room description, instead of the other way 'round.]
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

When play begins, say "Whoops.[line break][line break]You agreed to be an understudy for FILL_IN because they have, literally, never been sick a day in their life.  And, you suppose, they still haven't.  And normally, getting trampled by a rogue capybara still wouldn't dissuade them from performing in FILL_IN as FILL_IN, literally their favorite part in FILL_IN's entire oeuvre.  But FILL_IN the director apparently didn't think pushing a comatose patient on stage would do much for the audience's enjoyment, so here you are.[line break][line break]And normally, you'd be fine with this; you've understudied a lot.  But FILL_IN?  There was no way they weren't going to be here.  So you... never actually learned your part.  Or read the play, really.[line break][line break]But!  You have excellent improv skills, a keen sense of story and theater, a (generally) excellent cast to work with, and an uncanny ability to fully inhabit the characters you portray.  You got this."

Pastoral Opening is a room. The ooc_desc of Pastoral Opening is "The green-painted stage and blue backdrop imply an outdoors setting, and Bob is piping in a gently whooshing wind sound from the sound board."  The ic_desc of Pastoral Opening is "Ah, the fields of Ireland, where you have spent half your life.  Not a cloud in the sky, though a brisk wind makes you glad you brought your coat."

the audience is a backdrop which is everywhere.  The ooc_desc of the audience is "The stage lights prevent you from seeing the audience clearly, but you can hear them CLUE_AS_TO_HOW_YOU'RE_DOING."  The ic_desc of the audience is "Everyone that matters right now is here with you."


a box is a container in Pastoral Opening.  It is enterable.