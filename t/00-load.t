#!perl -T

use Test::More tests => 1;

BEGIN {
	use_ok( 'App::uri2mobi' );
}

diag( "Testing App::uri2mobi $App::uri2mobi::VERSION, Perl $], $^X" );
