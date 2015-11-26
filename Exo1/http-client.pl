#!/usr/bin/perl

$nomServeur = $ARGV[0] or die "Argument manquant";
$nomFichier = $ARGV[1] or die "Argument manquant";

use Socket;

socket (SERVEUR, PF_INET, SOCK_STREAM, getprotobyname('tcp'));
$adresse = inet_aton ("$nomServeur") || die ("inet_aton");
$adresse_complete = sockaddr_in("80",$adresse) || die ("sockaddr_in");
connect (SERVEUR, $adresse_complete) || die ("connect");
SERVEUR->autoflush(1);

print SERVEUR "GET /$nomFichier HTTP/1.1","\n";
print SERVEUR "Host: $nomServeur","\n";
print SERVEUR "\n";

while(<SERVEUR>) {
    print $_;
}

close (SERVEUR);
