package Perl::Core;
use 5.010_000;

use strict;
use warnings;
 
use match::simple           ();
use mro                     ();
use feature                 ();
use PerlX::Define           ();
use PerlX::Maybe            ();
use Syntax::Feature::Try    ();
use Sub::Infix              ();

use constant DEFAULT_VERSION => ':5.14';

sub import
{
    my ($class, $version) = @_;
    my $caller = scalar caller();
 
    warnings->import;
    strict->import;
    feature->import( $version ? ":$version" : DEFAULT_VERSION );
    mro::set_mro($caller, 'c3');

    PerlX::Define->import;
    Syntax::Feature::Try->install;
    no strict 'refs';
    *{$caller . '::maybe'} = \&PerlX::Maybe::maybe;
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

=head1 SYNOPSIS

    use Perl::Core

    # Your code here

=head1 DESCRIPTION

Perl::Core provides the best parts of Modern Perl in a single, user-friendly import. Perl version C<5.14> is used by default, but you can choose which version to use in your import statement.

    use Perl::Core '5.18';

The following modules and keywords will be automatically loaded into your script:

=over

=item L<strict> – Restrict unsafe constructs

=item L<warnings> – Enable optional warnings

=item L<feature> – Enable new language features based on selected version

=item L<mro> – Sane method resolution order under multiple inheritance (C<Class::C3>)

=item L<match::simple> – Simplified smartmatch with C<|in|> keyword

=item L<PerlX::Define> – Simplified constants with C<define> keyword

=item L<PerlX::Maybe> – Simplified conditional handling with C<maybe/provided> keywords

=item L<Syntax::Feature::Try> – Sane exception handling with C<try/catch/finally> keywords

=back
