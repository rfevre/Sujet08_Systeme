#!/usr/bin/perl

use POSIX ":sys_wait_h";

$filsMax = $ARGV[0] or die "Manque Argument";
$nbFils = 0;

while(<STDIN>){

    $wPid = waitpid(-1,WNOHANG);
    if ($wPid>0) {
	print "fils pid : $wPid => Terminé","\n";
	$nbFils--;
    }
    
    if ( $nbFils >= $filsMax ) {
	print "pere pid : $$ => Je doit attendre","\n";
	$pid=waitpid(-1,0);
	$nbFils--;
	print "fils pid : $pid => Terminé","\n";
    }
    
    $pid = fork();	
    if ($pid == 0) {
	`perl rien.pl`;
	exit 0;
    }
    else {
	print "fils pid : $pid => Demarre","\n";
	$nbFils++;
    }
}

