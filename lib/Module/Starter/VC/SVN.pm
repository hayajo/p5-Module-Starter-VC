package Module::Starter::VC::SVN;
use strict;
use warnings;
our $VERSION = '0.01';

use Cwd::Guard qw/cwd_guard/;
use ExtUtils::MakeMaker qw/prompt/;
use File::Path qw/make_path/;
use File::Copy;

sub post_create_distro {
    my $self  = shift;
    my $guard = cwd_guard( $self->{basedir} );
    if ( ! $self->{no_confirm_vc_init} ) {
        return unless prompt( 'Subversion friendly? [Yn] ', 'y' ) =~ /[Yy]/;
    }
    make_path(qw/trunk tags branches/);
    for ( glob '.* *' ) {
        next if /^\.+$/;
        next if /^(trunk|tags|branches)$/;
        move $_, File::Spec->catfile('trunk', $_);
    }
}

1;
__END__

=head1 NAME

Module::Starter::VC::SVN - subversion friendly

=head1 SYNOPSIS

  % module-starter --plugin=Module::Starter::Simple,Module::Starter::VC::SVN --module=Foo::Bar

  Added to MANIFEST: Build.PL
  Added to MANIFEST: Changes
  Added to MANIFEST: lib/Foo/Bar.pm
  Added to MANIFEST: MANIFEST
  Added to MANIFEST: README
  Added to MANIFEST: t/00-load.t
  Added to MANIFEST: t/boilerplate.t
  Added to MANIFEST: t/manifest.t
  Added to MANIFEST: t/pod-coverage.t
  Added to MANIFEST: t/pod.t
  Subversion friendly? [Yn]  [y]
  Created starter directories and files

=head1 DESCRIPTION

Module::Starter::Plugin::SVN changes directory-tree into subversion-friendly when create a module.

=head1 METHODS

=head2 post_create_distro

Changes directory-tree into subversion-friendly.

=head1 AUTHOR

hayajo E<lt>hayajo@cpan.orgE<gt>

=head1 SEE ALSO

L<Module::Starter>, L<Module::Setup::Plugin::VC::SVN>

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
