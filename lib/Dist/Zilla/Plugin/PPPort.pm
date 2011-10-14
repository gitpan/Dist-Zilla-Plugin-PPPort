package Dist::Zilla::Plugin::PPPort;
{
  $Dist::Zilla::Plugin::PPPort::VERSION = '0.004';
}

use 5.008;
use Moose;
with qw/Dist::Zilla::Role::FileGatherer/;
use Devel::PPPort;

my $content;
{
	local *PPPORT_FILE;
	open PPPORT_FILE, '>', \$content or confess "Couldn't open scalar filehandle";
	Devel::PPPort::WriteFile("&=".__PACKAGE__."::PPPORT_FILE");
	close PPPORT_FILE;
}

has filename => (
	is => 'ro',
	isa => 'Str',
	default => 'ppport.h'
);

sub gather_files {
	my $self = shift;
	$self->add_file(Dist::Zilla::File::InMemory->new(name => $self->filename, content => $content));
	return;
}

__PACKAGE__->meta->make_immutable;

no Moose;

1;



=pod

=head1 NAME

Dist::Zilla::Plugin::PPPort - PPPort for Dist::Zilla

=head1 VERSION

version 0.004

=head1 SYNOPSIS

In your dist.ini

 [PPPort]
 filename = ppport.h ;default

=head1 DESCRIPTION

This module adds a PPPort file to your distribution. By default it's called C<ppport.h>, but you can name differently.

=for Pod::Coverage gather_files
=end

=head1 AUTHOR

Leon Timmermans <leont@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by Leon Timmermans.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut


__END__

#ABSTRACT: PPPort for Dist::Zilla

