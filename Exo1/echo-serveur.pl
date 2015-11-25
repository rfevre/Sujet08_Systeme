#!/usr/bin/perl

use Socket;
socket (SERVEUR, PF_INET, SOCK_STREAM, getprotobyname('tcp'));
setsockopt (SERVEUR, SOL_SOCKET, SO_REUSEADDR, 1);
$mon_adresse = sockaddr_in ("7", INADDR_ANY);
bind(SERVEUR, $mon_adresse) || die ("bind");

listen (SERVEUR, SOMAXCONN) || die ("listen");
accept (CLIENT, SERVEUR) || die ("accept");
select (CLIENT);

while (<CLIENT>){
    print $_;
}

close (CLIENT);
close (SERVEUR);
