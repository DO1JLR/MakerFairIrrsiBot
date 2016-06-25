#!/usr/bin/perl
#!/usr/bin/perl
use JSON;                       # Zum verwenden der nodes.json
use LWP::Simple;                # Zum testen, wie die nodes.json aussieht, wird aber gerade nicht benötigt...
use Data::Dumper;				# Ausgabe der json zum testen (produktiv nicht benoetigt)
use strict;                     # Good practice
use warnings;                   # Good practice
use Irssi;                      # Für den Bot
use vars qw($VERSION %IRSSI);
$VERSION = "1.0";
%IRSSI = (
        authors         => "L3D",
        contact         => 'l3d@see-base.de',
        name            => "MakerFair Irssi Freifunk Bot",
        description     => "Ein Freifunk-IRC-Bot, der interessante Fakten des Freifunkes in den IRC pasten kann.",
        version         => "0.0.1",
	status			=> "pre-alpha",
        license         => "GPL"
);
# important Variables:
our $channelName = "see-base"; #Operate in this channel !1ELF


Irssi::signal_add 'message public', 'sig_message_public';


sub sig_message_public {
    my ($server, $msg, $nick, $nick_addr, $target) = @_;
    if ($target =~ m/#(?:$channelName)/) { # only operate in these channels
                # different messages to do something:
                if ($msg =~ m/!help/i){ #Reagiert auf "!help"
                $server->command("msg $nick Hey $nick, auf folgende Nachrichten reagiere ich:");
                        $server->command("msg $nick !help - ruft diese Hilfe auf!");
                        $server->command("msg $nick !start - Startet das Licht anmachen");
                        $server->command("msg $nick !seidenstraße - Uuuu Licht!");
			$server->command("msg $nick !licht  - Macht das Licht an");
		}
                if ($msg =~ m/!start|!seidenstasse|!seidenstraße|!licht|!go|!on/i){ #Reagiert auf "!name"
                        $server->command("msg $target Rohrpost wird gestartet");
			rohrpost();
                }
        }
}


#Hier werden die Informationen aus der nodes.json geholt...
sub rohrpost{
	print "Rohrpost start";

}


