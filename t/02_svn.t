use strict;
use Test::More tests => 3;

use Module::Starter qw(
    Module::Starter::Simple
    Module::Starter::VC::SVN
);
use File::Spec;
use File::Temp;

my $tmpdir  = File::Temp->newdir;
my $starter = Module::Starter->new(
    dir     => $tmpdir,
    builder => 'ExtUtils::MakeMaker',
    modules => [qw/Foo::Bar/],
    email   => 'yourname@example.com',
    author  => 'yourname',
    force   => 1,
);
$starter->create_distro;
$starter->{no_confirm_vc_init} = 1;
$starter->post_create_distro;

ok -d File::Spec->catdir($tmpdir, 'trunk');
ok -d File::Spec->catdir($tmpdir, 'tags');
ok -d File::Spec->catdir($tmpdir, 'branches');
