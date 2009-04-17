package App::uri2mobi;

use warnings;
use strict;

use base 'Class::Accessor::Fast';
__PACKAGE__->mk_accessors( qw( uri xpath output_file clean ) );

use HTML::Excerpt::FromXPath;
use HTML::Image::Save;
use Mobigen::Command;

use Getopt::Long;
use File::Slurp;
use File::Path;

use Carp;


__PACKAGE__->run unless caller();

=head1 NAME

App::uri2mobi - Scrape a web page and turn it in a MOBI ebook

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

    use App::uri2mobi;

    my $uri2mobi = App::uri2mobi->new(
      uri => $uri,
      xpath => $xpath,
      output_file => $output_file,
      clean_tmp => 1,
    );
    $uri2mobi->convert();

=head1 EXPORT

A list of functions that can be exported.  You can delete this section
if you don't export anything, such as for a purely object-oriented module.

=head1 FUNCTIONS

=head2 new

=cut

sub new {
    my ($class, %args) = @_;
    
    my $self = {
        uri => $args{uri},
        xpath => $args{xpath},
        output_file => $args{output_file},
        clean => $args{clean},
    };
    
    return bless($self, $class);
}

=head2 run

=cut

sub run {
    my $config = { clean => 1 };
    GetOptions( $config, 'uri=s', 'xpath=s', 'output=s', 'clean' );
        
    my $uri2mobi = App::uri2mobi->new();
    $uri2mobi->uri( $config->{uri} );
    $uri2mobi->xpath( $config->{xpath} );
    $uri2mobi->output_file( $config->{output} );
    $uri2mobi->clean( $config->{clean} );
                    
    $uri2mobi->convert();
}

=head2 convert

=cut

sub convert {
    my $self = shift;
    
    croak( "No URI" ) unless $self->uri;

    my $ua = HTML::Excerpt::FromXPath->new();
    my $result = $ua->scrape(
        url => $self->uri,
        xpath => $self->xpath,
    );
    my $html = $result->[0]->as_HTML;
    my $img_saver = HTML::Image::Save->new();
    $img_saver->html( $html );
#    $img_saver->output_html( 'uri2mobi.html' );
    $img_saver->output_dir( './tmp_uri2mobi' );
    $img_saver->img_dir( 'images' );
    $html = $img_saver->save();

    write_file( 'uri2mobi.html', $html );
    
    my $mobigen = Mobigen::Command->new();
    $mobigen->input_file( 'uri2mobi.html' );
    $mobigen->output_file( $self->output_file );
    $mobigen->execute();

    if ($self->clean) {
        rmtree( './tmp_uri2mobi' );
        rmtree( 'uri2mobi.html' );
    }
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
