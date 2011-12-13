#!/usr/bin/perl
# Ported from C to Perl by Anders Bergh <anders1@gmail.com>
# Some Perlification by John Gabriele (4-24-2007).

use strict;
use warnings;
use Time::HiRes qw( gettimeofday );

my $BAILOUT = 16;
my $MAX_ITERATIONS = 1000;
my $begin = gettimeofday();

sub mandelbrot {
    my ( $x, $y ) = @_;

    my $cr = $y - 0.5;
    my $ci = $x;
    my ( $zi, $zr ) = ( 0.0, 0.0 );
    my $i = 0;

    my ( $temp, $zr2, $zi2 );
    while ( 1 ) {
        $i += 1;
        $temp = $zr * $zi;
        $zr2  = $zr * $zr;
        $zi2  = $zi * $zi;
        $zr = $zr2 - $zi2 + $cr;
        $zi = $temp + $temp + $ci;
        if ( $zi2 + $zr2 > $BAILOUT ) {
            return $i;
        }
        if ( $i > $MAX_ITERATIONS ) {
            return 0;
        }
    }
}

for ( my $y = -39; $y < 39; $y++ ) {
    my $i;
    for ( my $x = -39; $x < 39; $x++ ) {
        $i = mandelbrot( $x / 40.0, $y / 40.0 );
        if ( $i == 0 ) {
        }
        else {
        }
    }
}

print "\n";
my $end = gettimeofday() - $begin;
print "Perl Elapsed $end\n";
