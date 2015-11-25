#!/usr/bin/perl

use Socket;
socket (SERVEUR, PF_INET, SOCK_STREAM, getprotobyname('tcp'));
$adresse = inet_aton ("localhost") || die ("inet_aton");
$adresse_complete = sockaddr_in("7",$adresse) || die ("sockaddr_in");
connect (SERVEUR, $adresse_complete) || die ("connect");
SERVEUR->autoflush(1);

while (<SERVEUR>) {
    print SERVEUR <STDIN>;
    print $_;
}

close (SERVEUR);

