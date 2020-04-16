BEGIN YY#TH

//0. Upon entering area.

CHAIN IF ~NumTimesTalkedTo(0)~ THEN YY#TH YY#Theil0
    ~Bhaalspawn~
    = ~Hold, there is no need for alarm - 'twas a statement, not accusation… What brings you here, I wonder?~
    == HAERDAJ IF ~InParty("Haer'dalis") !StateCheck("Haer'dalis",CD_STATE_NOTVALID)~ THEN ~Oh my... 'Tis a most peculiar sensation indeed. Yon falcon is more than meets the eye.~
    == KELDORJ IF ~InParty("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ THEN ~I... I sense no malice from this woman, CHARNAME. Quite the opposite, in fact.~
    == KORGANJ IF ~InParty("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN ~Hmph, what're we waiting for? Let's lop'er head off and be done with it!~
END
        ++ ~You won’t stand in my way! Kill it! (Attack)~ + YY#Theil0_demon
        ++ ~You know what I am, how? Speak!~ + YY#Theil0_know
        ++ ~Adventure, excitement and treasure - especially the treasure!~ + YY#Theil0_adventure
        ++ ~The sphere locked us in.. But who are you?~ + YY#Theil0_who

CHAIN YY#TH YY#Theil0_demon
    ~That's my exit.~ 
    DO ~SetGlobal("YY#THNoJoin","GLOBAL",1) ForceSpell(Myself,DRYAD_TELEPORT) EscapeArea() 
    AddJournalEntry(@10001,QUEST_DONE) /* The Hooded Stranger.

    I met a strange woman in the Planar Sphere, but she disappeared before we could get near. I guess she didn't take our hostile reaction well. */~ EXIT

CHAIN YY#TH YY#Theil0_know
    IF ~Dead("LAVOK01")~ THEN ~(She retreats defensively) Some things are more apparent than others, while fewer things are impossible to ignore... But, you are here for Lavok? Yes. I feel him fading on the other side... and it lingers, if barely.~
    ==YY#TH IF ~!Dead("LAVOK01")~ THEN ~(She retreats defensively) Some things are more apparent than others, while fewer things are impossible to ignore… But, you are here for Lavok? Beware, the energy of the planes bolster its power.~
    == YY#TH IF ~Dead("TOLGER2")~ THEN ~The Sphere is unstable and I must see to the wards if we are to return to your plane in one piece. Perhaps we will speak again after. ~
    == YY#TH IF ~!Dead("TOLGER2")~ THEN ~The sphere is unstable and I must see to the wards if we are to return to your plane in one piece. But beware the lower levels, two others of your ilk have made their way there… not that they will be a match for you. Perhaps we will speak again after.~
    DO ~SetGlobal("YY#THTentative","GLOBAL",1) ForceSpell(Myself,DRYAD_TELEPORT) EscapeArea()
    AddJournalEntry(@10002,QUEST) /* The Hooded Stranger.

    I met a strange woman in the Planar Sphere. She seems to be connected to these events somehow. I should keep an eye out for her in the sphere once we're back to our plane. */~ EXIT

CHAIN YY#TH YY#Theil0_adventure
    IF ~Dead("LAVOK01")~ THEN ~Indeed? Then you shan't be disappointed. This ship has seen many planes, and its owner was a magpie of sundries - living or otherwise… But, you are here for Lavok? Yes. I feel him fading on the other side... Yet it lingers, if barely.~
    == YY#TH IF ~!Dead("LAVOK01")~ THEN ~Indeed? Then you shan't be disappointed. This ship has seen many planes, and its owner was a magpie of sundries - living or otherwise… But, you are here for Lavok? Beware, the energy of the planes bolster its power.~
    == YY#TH IF ~Dead("TOLGER2")~ THEN ~The Sphere is unstable and I must see to the wards if we are to return to your plane in one piece. Perhaps we will speak again after. ~
    == YY#TH IF ~!Dead("TOLGER2")~ THEN ~The sphere is unstable and I must see to the wards if we are to return to your plane in one piece. But beware the lower levels, two others of your ilk have made their way there… not that they will be a match for you. Perhaps we will speak again after.~
    DO ~SetGlobal("YY#THTentative","GLOBAL",1) ForceSpell(Myself,DRYAD_TELEPORT) EscapeArea()
    AddJournalEntry(@10002,QUEST)~ EXIT

CHAIN YY#TH YY#Theil0_who
    IF ~Dead("LAVOK01")~ THEN ~I am Theil, and a guardian of this place… But, you are here for Lavok? Yes. I feel him fading on the other side... Yet it lingers, if barely.~
    == YY#TH IF ~!Dead("LAVOK01")~ THEN ~I am Theil, and a guardian of this place But, you are here for Lavok? Beware, the energy of the planes bolster its power.~
    == YY#TH IF ~Dead("TOLGER2")~ THEN ~The Sphere is unstable and I must see to the wards if we are to return to your plane in one piece. Perhaps we will speak again after. ~
    == YY#TH IF ~!Dead("TOLGER2")~ THEN ~The sphere is unstable and I must see to the wards if we are to return to your plane in one piece. But beware the lower levels, two others of your ilk have made their way there… not that they will be a match for you. Perhaps we will speak again after.~
    DO ~SetGlobal("YY#THTentative","GLOBAL",1) ForceSpell(Myself,DRYAD_TELEPORT) EscapeArea() SetGlobal("YY#TheilEarlyReveal","GLOBAL",1)
    AddJournalEntry(@10002,QUEST)~ EXIT

//1. Join Me

CHAIN IF ~Global("YY#THTentative","GLOBAL",1) Alignment(Player1,MASK_EVIL)~ THEN YY#TH YY#Theil1
    ~Faerûn... (She looks up from the map upon your approach) That’s where we are, yes?~ 
END
        ++ ~What do I care? Get out of my sphere.~ +YY#Theil1_out
        ++ ~It is. We’re in Athkatla, specifically, in the Amnish regions.~ +YY#Theil1_amn

CHAIN YY#TH YY#Theil1_out
~So be it. [dimension door]~ DO ~SetGlobal("YY#THNoJoin","GLOBAL",1) ForceSpell(Myself,DRYAD_TELEPORT) EscapeArea() 
    AddJournalEntry(@10003,QUEST_DONE)~ EXIT

CHAIN YY#TH YY#Theil_amn
~I see... I am at a loss. I must investigate how the Sphere came to be returned here at this moment, but lack the means to in more ways than one.~ 
= ~I know not where your path leads, but you appear decent and capable. Should you be willing to aid me, I shall endeavor to return the favor.~
END
    ++ ~Wait, who are you even?~ + YY#Theil1_who
    ++ ~Why do you need my help in this?~ + YY#Theil1_why
    ++ ~What do I get in return for helping you?~ + YY#Theil1_gimme
    ++ ~Why is this so important to you?~ + YY#Theil1_important
    ++ ~I'd be glad to help~ + YY#Theil1_yes
    ++ ~I have no interest in this, and my own quest will not wait.~ + YY#Theil1_nope
   

CHAIN YY#TH YY#Theil1_who
    IF ~Global("YY#TheilEarlyReveal","GLOBAL",1)~ THEN ~Have we not been over this...? You may call me Theil, and I was a guardian of the Sphere up till your untimely arrival.~ 
    = IF ~!Global("YY#TheilEarlyReveal","GLOBAL",1)~ THEN ~You may call me Theil, and I was a guardian of the Sphere up till your untimely arrival.~
    END
        ++ ~You weren’t very good at your job, were you?~ + YY#Theil1_badj 
        ++ ~You don’t look like much of a guardian.~ + YY#Theil_guardian 

        CHAIN YY#TH YY#Theil_badj
            ~(She snorts) Perhaps not. Perhaps I should have let one of the Children meet an early end in the Abyss.~
        END
            ++	~That’s not very nice, and it sounded an awful lot like a threat!~ + YY#Theil1_bjend
            ++	~I don’t take kindly to being threatened by anyone.~ + YY#Theil1_bjend
        
        CHAIN YY#TH YY#Theil1_bjend 
        ~I... no, you are right. I apologize, our jump back was not easy on me.~ 
        END
            ++ ~Why do you need my help in this?~ + YY#Theil1_why
            ++ ~What do I get in return for helping you?~ + YY#Theil1_gimme
            ++ ~Why is this so important to you?~ + YY#Theil1_important
            ++ ~I'd be glad to help~ + YY#Theil1_yes
            ++ ~I have no interest in this, and my own quest will not wait.~ +YY#Theil1_nope
        
        CHAIN YY#TH YY#Theail1_guardian
        ~No… Perhaps I do not, and I am one no longer.~ 
        END
            ++ ~Why do you need my help in this?~ + YY#Theil1_why
            ++ ~What do I get in return for helping you?~ + YY#Theil1_gimme
            ++ ~Why is this so important to you?~ + YY#Theil1_important
            ++ ~I'd be glad to help~ + YY#Theil1_yes
            ++ ~I have no interest in this, and my own quest will not wait.~ + YY#Theil_nope

CHAIN YY#TH YY#Theil1_why
~Lavok's sphere has been forgotten for decades, and no records of it should remain. Yet, someone knew enough to find it, and had power enough to draw it back – more than anything Tolgerias and his compatriots could have mustered on their own...~
= ~I have my suspicions as to whom, and it could lead to a confrontation before its end. Strong as they may be, and unfamiliar with these lands as I am, I would do better facing this with allies at my side.~ 
END
    ++ ~Wait, who are you even?~ + YY#Theil1_who
    ++ ~What do I get in return for helping you?~ + YY#Theil1_gimme
    ++ ~Why is this so important to you?~ + YY#Theil_important
    ++ ~I'd be glad to help~ + YY#Theil1_yes
    ++ ~I have no interest in this, and my own quest will not wait.~ YY#Theil_nope 

CHAIN YY#TH YY#Theil1_gimme
~If it is treasure you seek, I hold a relic that could prove useful in your own quest. And no, you will not find it on my person before this is over.~
= ~I am also a diviner of no small talent and shall remain with you to see your own quest through to the end, or till you see fit for us to part ways.~
DO ~SetGlobal("YY#TheilAskReward","GLOBAL",1)~
END
    ++ ~Wait, who are you even?~ + YY#Theil1_who
    ++ ~Why do you need my help in this?~ + YY#Theil1_why
    ++ ~Why is this so important to you?~ + YY#Theil_important
    ++ ~I'd be glad to help~ + YY#Theil1_yes
    ++ ~I have no interest in this, and my own quest will not wait.~ YY#Theil_nope 

CHAIN YY#TH YY#Theil1_important
~The Sphere has been my responsibility for too long for me to so easily let it go... and I admit to desiring closure over the issue.~
END     
    ++ ~Wait, who are you even?~ + YY#Theil1_who
    ++ ~Why do you need my help in this?~ + YY#Theil1_why
    ++ ~What do I get in return for helping you?~ + YY#Theil1_gimme
    ++ ~Then I will help you, gladly. Where do we start?~ + YY#Theil1_yes
    ++ ~I have no interest in this, and my own quest will not wait.~ YY#Theil_nope 

CHAIN YY#TH YY#Theil1_yes
~I had a chance to go through the Cowled Ones’ effects when the worst dangers were past. It seems they kept lodgings near a large market square, not far from here. We should look to see if anything was left behind.~ 
END
    ++ ~I have no need for you just yet. Allow me to think on this.~ + YY#Theil1_wait
    ++ ~Join with me, and let's go.~ + YY#Theil1_letsgo
 
CHAIN YY#TH YY#Theil1_wait
~Then I shall remain for a while to gain my bearings. But then I will have to attempt this on my own, before the trail goes cold.~
DO ~SetGlobal("YY#TheilWaiting","GLOBAL",1) 
    AddJournalEntry(@10004,QUEST)~ EXIT
/*The Truth About Cats and Birds

The blind woman in the sphere calls herself "Theil", and has asked for my help with something that could prove dangerous. I get the feeling she isn't being completely upfront. She has given me a day to consider her proposal. */

CHAIN YY#TH YY#Theil1_letsgo
DO ~SetGlobal("YY#TheilJoined","GLOBAL",1) 
    EraseJournalEntry(@10004) AddJournalEntry(@10005,QUEST)~ EXIT


CHAIN YY#TH YY#Theil1_nope
~I understand, then I bid you farewell.~ 

//2. You came back. 1 day

IF ~Global("YY#TheilWaiting","GLOBAL",1)~ YY#Theil2
    SAY ~You return. Have you changed your mind?~
        ++ ~Yes, join me.~ + YY#Theil1_letsgo
        ++ ~No, I was just looking around.~ END
EXIT

//2. Recruitment