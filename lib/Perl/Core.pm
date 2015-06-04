package Perl::Core;
use 5.010_000;

use strict;
use warnings;
 
use match::simple         ();
use mro                   ();
use feature               ();
use Syntax::Feature::Try  ();
use Sub::Infix            ();

use constant DEFAULT_VERSION => ':5.14';

sub import
{
    my ($class, $version) = @_;
    my $caller = scalar caller();
 
    warnings->import;
    strict->import;
    feature->import( $version ? ":$version" : DEFAULT_VERSION );
    mro::set_mro($caller, 'c3');

    Syntax::Feature::Try->install;
    no strict 'refs';
    *{$caller . '::in'} = Sub::Infix::infix { match::simple::match @_ };
}
 
sub unimport
{
    warnings->unimport;
    strict->unimport;
    feature->unimport;
}
 
1;

# ABSTRACT: Perl core essentials in a single import
