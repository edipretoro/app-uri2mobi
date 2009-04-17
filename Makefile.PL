use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'App::uri2mobi',
    AUTHOR              => 'Emmanuel Di Pretoro <<edipretoro@gmail.com>>',
    VERSION_FROM        => 'lib/App/uri2mobi.pm',
    ABSTRACT_FROM       => 'lib/App/uri2mobi.pm',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'perl')
      : ()),
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
        'HTML::Excerpt::FromXPath' => 0,
        'Mobigen::Command' => 0,
        'HTML::Image::Save' => 0,
        'Getopt::Long' => 0,
        'File::Slurp' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'App-uri2mobi-*' },
);
