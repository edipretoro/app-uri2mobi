use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'App::uri2mobi',
    license             => 'perl',
    dist_author         => 'Emmanuel Di Pretoro <<edipretoro@gmail.com>>',
    dist_version_from   => 'lib/App/uri2mobi.pm',
    build_requires => {
        'Test::More' => 0,
    },
    add_to_cleanup      => [ 'App-uri2mobi-*' ],
    create_makefile_pl => 'traditional',
);

$builder->create_build_script();
