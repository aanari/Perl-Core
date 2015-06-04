package Perl::Core;
use 5.010_000;
 
use strict;
use warnings;
 
use mro     ();
use feature ();
 
use IO::File   ();
use IO::Handle ();

use constant DEFAULT_VERSION => ':5.14';

sub import
{
    my ($class, $version) = @_;
 
    warnings->import;
    strict->import;
    feature->import( $version ? ":$version" : DEFAULT_VERSION );
    mro::set_mro( scalar caller(), 'c3' );
}
 
sub unimport
{
    warnings->unimport;
    strict->unimport;
    feature->unimport;
}
 
1;

# ABSTRACT: Perl core essentials in a single import
