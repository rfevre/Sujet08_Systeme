#!/usr/bin/perl
use Socket;
use POSIX ":sys_wait_h";

socket (SERVEUR, PF_INET, SOCK_STREAM, getprotobyname('tcp'));
setsockopt (SERVEUR, SOL_SOCKET, SO_REUSEADDR, 1);
$mon_adresse = sockaddr_in ("7777", INADDR_ANY);
bind(SERVEUR, $mon_adresse) || die ("bind");
listen (SERVEUR, SOMAXCONN) || die ("listen");

while (true) {
    accept (CLIENT, SERVEUR) || die ("accept");

    if(fork() == 0) {
	CLIENT->autoflush(1);
	while (<CLIENT>){
	    print CLIENT "serveur : $_";
	}
	exit 0;
    }

    close (CLIENT);
    do{
	$wPid = waitpid(-1,WNOHANG);
    }while($wPid > 0);
}

close (SERVEUR);
