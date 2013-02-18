package Module::Starter::VC::Git;
use strict; use warnings;
our $VERSION = '0.01';

use Cwd::Guard qw/cwd_guard/;
use ExtUtils::MakeMaker qw/prompt/;

sub post_create_distro {
    my $self  = shift;
    my $guard = cwd_guard( $self->{basedir} );
    if ( ! $self->{no_confirm_vc_init} ) {
        return unless prompt( 'Git init? [Yn] ', 'y' ) =~ /[Yy]/;
    }
    return if ( system( 'git', 'init' ) );
    return if ( system( 'git', 'add', '-A' ) );
    system( 'git', 'commit', '-m', 'initial commit' );
}

1;
__END__

=head1 NAME

Module::Starter::VC::Git - git init

=head1 SYNOPSIS

  % module-starter --plugin=Module::Starter::Simple,Module::Starter::VC::Git --module=Foo::Bar

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
  Git init? [Yn]  [y]
  Created starter directories and files

=head1 DESCRIPTION

Module::Starter::Plugin::Git execute initial commit of Git when create a module.

=head1 AUTHOR

hayajo E<lt>hayajo@cpan.orgE<gt>

=head1 SEE ALSO

L<Module::Starter>, L<Module::Setup::Plugin::VC::Git>

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
