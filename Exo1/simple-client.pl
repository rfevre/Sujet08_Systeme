#!/usr/bin/perl

use Socket;
socket (SERVEUR, PF_INET, SOCK_STREAM, getprotobyname('tcp'));
$adresse = inet_aton ("localhost") || die ("inet_aton");
$adresse_complete = sockaddr_in("3000",$adresse) || die ("sockaddr_in");
connect (SERVEUR, $adresse_complete) || die ("connect");
print "OK\n";
while (<SERVEUR>) {
    print "Message du serveur } ",$_;
}
close (SERVEUR);
