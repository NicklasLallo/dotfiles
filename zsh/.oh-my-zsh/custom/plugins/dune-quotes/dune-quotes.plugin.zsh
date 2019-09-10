dune_quotes=(

	## Sources: Dune books (Frank Herbert) and film (David Lynch)
	## https://en.wikiquote.org/wiki/Dune
	## https://en.wikiquote.org/wiki/Dune_(film)

	#Paul Muad'Dib Atreides
	"There is no escape — we pay for the violence of our ancestors.\n - Paul Muad'Dib Atreides"
	"He who can destroy a thing, controls a thing.\n - Paul Muad'Dib Atreides"
	"Long live the fighters!\n - Paul Muad’Dib Atreides"
	"My name is a killing word.\n - Paul Muad’Dib Atreides"
	"Father... father, the sleeper has awakened!\n - Paul Muad’Dib Atreides"
	"Now remember, walk without rhythm, and we won't attract the worm.\n - Paul Muad’Dib Atreides"
	"Are you suggesting the Duke's son is an animal?\n - Paul Muad’Dib Atreides"
	"I will bend like a reed in the wind.\n - Paul Muad’Dib Atreides"

	#Duke Leto Atreides
	"I must rule with eye and claw — as the hawk among lesser birds.\n - Duke Leto Atreides"
	"I'll miss the sea. But a man needs new experiences. They jar something deep inside, allowing him to grow. Without change, something sleeps inside of us and seldom awakens. The sleeper must awaken.\n - Duke Leto Atreides"
	"The sleeper must awaken.\n - Duke Leto Atreides"

	#Alia Atreides
	"And how can this be? For he is the Kwisatz Haderach!\n - Alia Atreides"

	#Mentat Thufir Hawat
	"Those sounds could be imitated.\n - Mentat Thufir Hawat"
	"Parting with friends is a sadness. A place is only a place.\n - Mentat Thufir Hawat"

	#Gurney Hallek
	"Not in the mood? Mood's a thing for cattle and loveplay, not fighting!\n - Gurney Halleck"
	"If wishes were fishes, we'd all cast nets.\n - Gurney Halleck"
	"Good. The slow blade penetrates the shield... but, uh, look down. We'd have joined each other in death.\n - Gurney Halleck"
	"Soon we leave for Arrakis. Arrakis is real. The Harkonnens are real.\n - Gurney Halleck"

	#Duncan Idaho
	"May the Hand of God be with you.\n - Duncan Idaho"

	#Dr. Liet-Kynes
	"He shall know your ways as if born to them.\n - Dr. Liet-Kynes"
	"Bless the maker and his water, bless the coming and going of him, may his passing cleanse the world.\n - Dr. Liet-Kynes"

	#Fremen
	"Bless the Maker and all His Water. Bless the coming and going of Him, May His passing cleanse the world. May He keep the world for his people. - Fremen Saying"
	"May thy knife chip and shatter.\n - Fremen saying of ill will against an adversary; Jamis to Paul before their duel"

	#Stilgar
	"Usul, we have wormsign the likes of which even God has never seen.\n - Stilgar"
	"To save one from a mistake is a gift of paradise.\n - Stilgar"

	#Chani
	"Tell me of your homeworld Usul.\n - Chani"
	"I would not have permitted you to harm my tribe.\n - Chani"

	#Bene Gesserit
	"I must not fear. Fear is the mind-killer. Fear is the little-death that brings total obliteration. I will face my fear. I will permit it to pass over me and through me. And when it has gone past I will turn the inner eye to see its path. Where the fear has gone there will be nothing. Only I will remain.\n - Bene Gesserit Litany Against Fear"
	"They tried and died.\n - Mother Gaius Helen Mohiam"

	#Princess Irulan
	"A beginning is a very delicate time.\n - Princess Irulan"
	"God created Arrakis to train the faithful.\n - The Wisdom of Muad'Dib by the Princess Irulan"

	#Baron Vladimir Harkonnen
	"He who controls the Spice, controls the universe!\n - Baron Vladimir Harkonnen"

	#Feyd-Rautha Harkonnen
	"You see your death. My blade will finish you.\n - Feyd-Rautha Harkonnen"

	#Mentat Piter De Vries
	"It is by will alone I set my mind in motion. It is by the juice of sapho that thoughts acquire speed, the lips acquire stains, the stains become a warning. It is by will alone I set my mind in motion. \n - The Mentat Mantra, recited by Piter De Vries"
	"Vendetta, he says, using the ancient tongue. The art of kanly is still alive in the Universe.\n - Mentat Piter De Vries"
	"Take them to the desert as the traitor suggested. The worms will destroy the evidence. Their bodies must never be found.\n - Mentat Piter De Vries"

	#The Guild
	"A Secret Report within the Guild. Four Planets have come to our attention regarding a plot which could jeopardise Spice Production: Planet Arrakis, Source of the Spice. Planet Caladan, home of House Atreides. Planet Geidi Prime, home of House Harkonnen. Planet Kaitain, Home of the Emperor of the Known Universe. Send a third-stage Guild Navigator to Kaitain to demand details from the Emperor. The Spice must flow.\n - The Guildmaster"
	"The Bene Gesserit witch must leave.\n - Guildsman" 

	#Frank Herbert
	"Muad’Dib learned rapidly because his first training was in how to learn.\n - Frank Herbert - Dune"

)
echo "${dune_quotes[$(($RANDOM % ${#dune_quotes[@]} + 1))]}"
echo
unset dune_quotes
