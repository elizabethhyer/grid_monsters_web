### SEED DATABASE ###

## Users ##
dracula = User.create(:name => "Dracula", :username => "vampman2000", :password => "hooray4blood")

the_mummy = User.create(:name => "The King", :username => "linenlover404", :password => "asleep4ages")

the_blob = User.create(:name => "The Blob", :username => "huskyguy", :password => "shapeshifter")

gelatinous_cube = User.create(:name => "Cube", :username => "gelatinous_cube", :password => "dndnd")

the_dark_spirit = User.create(:name => "Dark Spirit", :username => "tall_dark_n_sexy", :password => "dementorsRcool")

the_programmer =  User.create(:name => "Mr. Roboto", :username => "the_programmer", :password => "StepFord")

## Profiles ##
vampy = Profile.create(:name => "Dracula", :species => "vampire", :age => 2000, :bio => "Very busy and very wealthy. Just looking for a nice undead girl to live out my eternity feasting on the innocent with. Last time I did something like this was when Lonely Hearts ads were a thing, and I was catfished by Harry Powers! True story. If you let the right one in, I'll tell you all about it.")

thats_a_wrap = Profile.create(:name => "The Mummy King", :species => "undead human", :age => 4100, :bio => "I'm new to this whole dating game, since my partners in the land of the living were all chosen for me. I guess I should say that I live in a museum, so the only thing to eat is the guards who cross the threshold of the mummy, but my decor game is on point. I'm happy to meet at your place though, as long as your sheets are made from linen. I'm very picky.")

blobby_knight = Profile.create(:name => "The Blob", :species => "blob", :age => 1, :bio => "I'm really tired of people telling me I don't look the same in person as I do in my photos. Please, I'm just a blob, standing in front of a computer, saying that if you reject me because of my looks, I'm going to get just a little bit blobbier. (I'm going to absorb you, if I hadn't made that clear)")

the_gelatinous_curtain = Profile.create(:name => "Gelatinous Cube", :species => "standard DND monster", :age => 1,000,000,000, :bio => "Honestly I am too old for the games... you're either interested or not. Likes: picking fights with bands of travelers; dislikes: vegans.")

ghost = Profile.create(:name => "Dark Spirit", :species => "ghost", :age => 30, :bio => "I think there's so much more to be said for how romantic it is to haunt couples on their moonlit walks. Too many other ghosts stick to houses or graveyards, and I just want someone who craves a bit of ADVENTURE and ROMANCE, you know?")

roboto = Profile.create(:name => "Mr. Roboto", :species => "humanoid", :age => 45, :bio => "I have no interest in killing you and replacing you with the robots I learned how to build during my tenure at Disney Land. ... So, when would you like to meet?")

## Associations ##

vampy.user = dracula 
vampy.save

thats_a_wrap.user = the_mummy 
thats_a_wrap.save

blobby_knight.user = the_blob
blobby_knight.save

the_gelatinous_curtain.user = gelatinous_cube
the_gelatinous_curtain.save

ghost.user = the_dark_spirit
ghost.save

roboto.user = the_programmer
roboto.save