# NAME

Perl::Core - Perl core essentials in a single import

# VERSION

version 0.0100

# SYNOPSIS

    use Perl::Core;

    # Your code here

# DESCRIPTION

Perl::Core provides the best parts of Modern Perl in a single, user-friendly import. Perl version `5.14` is used by default, but you can choose which version to use in your import statement.

    use Perl::Core '5.18';

The following modules and keywords will be automatically loaded into your script:

- [strict](https://metacpan.org/pod/strict) – Restrict unsafe constructs
- [warnings](https://metacpan.org/pod/warnings) – Enable optional warnings
- [feature](https://metacpan.org/pod/feature) – Enable new language features based on selected version
- [mro](https://metacpan.org/pod/mro) – Sane method resolution order under multiple inheritance ([Class::C3](https://metacpan.org/pod/Class::C3))
- [match::simple](https://metacpan.org/pod/match::simple) – Simplified smartmatch with `|in|` keyword
- [PerlX::Define](https://metacpan.org/pod/PerlX::Define) – Simplified constants with `define` keyword
- [PerlX::Maybe](https://metacpan.org/pod/PerlX::Maybe) – Simplified conditional handling with `maybe/provided` keywords
- [Syntax::Feature::Try](https://metacpan.org/pod/Syntax::Feature::Try) – Sane exception handling with `try/catch/finally` keywords

# BUGS

Please report any bugs or feature requests on the bugtracker website
https://github.com/aanari/Perl-Core/issues

When submitting a bug or request, please include a test-file or a
patch to an existing test-file that illustrates the bug or desired
feature.

# AUTHOR

Ali Anari <ali@anari.me>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2015 by Ali Anari.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
