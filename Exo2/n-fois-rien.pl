#!/usr/bin/perl

use POSIX ":sys_wait_h";

$cpt = $ARGV[0] or die "Manque Argument";

for ($i=0; $i<$cpt; $i++) {
    $pid = fork();
    if ($pid == 0) {
	print "fils pid : $$ => Demarre","\n"; 
	`perl rien.pl`;
	exit 0;
    }
}

do{
    $pid = wait();
    print "fils pid : $pid => Terminé","\n"; 
}while($pid>0);

	   
