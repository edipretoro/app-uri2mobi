package App::uri2mobi;

use warnings;
use strict;

use HTML::Excerpt::XPath;
use HTML::Image::Save;
use Mobigen::Command;

use Getopt::Long;

__PACKAGE__->run unless caller();

=head1 NAME

App::uri2mobi - The great new App::uri2mobi!

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use App::uri2mobi;

    my $foo = App::uri2mobi->new();
    ...

=head1 EXPORT

A list of functions that can be exported.  You can delete this section
if you don't export anything, such as for a purely object-oriented module.

=head1 FUNCTIONS

=head2 new

=cut

sub new {
}

=head2 run

=cut

sub run {
}

=head1 AUTHOR

Emmanuel Di Pretoro, C<< <<edipretoro at gmail.com>> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-app-uri2mobi at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=App-uri2mobi>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc App::uri2mobi


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=App-uri2mobi>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/App-uri2mobi>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/App-uri2mobi>

=item * Search CPAN

L<http://search.cpan.org/dist/App-uri2mobi/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 COPYRIGHT & LICENSE

Copyright 2009 Emmanuel Di Pretoro, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.


=cut

1; # End of App::uri2mobi
