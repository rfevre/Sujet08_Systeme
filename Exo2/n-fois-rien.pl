#!/usr/bin/perl

use POSIX ":sys_wait_h";

$cpt = $ARGV[0] or die "Manque Argument";
@list = ();

for ($i=0; $i<$cpt; $i++) {
    $pid = fork();
    if ($pid == 0) {
	print "fils pid : $$ => Demarre","\n"; 
	`perl rien.pl`;
	exit 0;
    }
    else {
	$list[@list]=$pid;
    }
}

foreach $i (@list) {
    $pid = waitpid($i,0);

}

	   
