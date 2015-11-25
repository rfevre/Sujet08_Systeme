#!/usr/bin/perl

$cpt=1;

if (scalar @ARGV == 1) {
    $cpt = $ARGV[0];
    print "$i","\n";
}

use Socket;
socket (SERVEUR, PF_INET, SOCK_STREAM, getprotobyname('tcp'));
setsockopt (SERVEUR, SOL_SOCKET, SO_REUSEADDR, 1);
$mon_adresse = sockaddr_in ("3000", INADDR_ANY);
bind(SERVEUR, $mon_adresse) || die ("bind");

while(true) {
    listen (SERVEUR, SOMAXCONN) || die ("listen");
    accept (CLIENT, SERVEUR) || die ("accept");
    select (CLIENT);
    for ( $i = 0; $i < $cpt ; $i++) {
	print "bonjour\n";
    }
    close (CLIENT);
}
close (SERVEUR);

