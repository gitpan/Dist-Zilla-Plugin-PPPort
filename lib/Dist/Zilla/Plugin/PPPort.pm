package Dist::Zilla::Plugin::PPPort;
{
  $Dist::Zilla::Plugin::PPPort::VERSION = '0.001';
}

use 5.008;
use Moose;
with qw/Dist::Zilla::Role::FileGatherer/;
use Devel::PPPort;

my $content;
open PPPORT_FILE, '>', \$content or confess "Couldn't open scalar filehandle";
Devel::PPPort::WriteFile("&=".__PACKAGE__."::PPPORT_FILE");
close PPPORT_FILE;

sub gather_files {
	my $self = shift;
	my $file = Dist::Zilla::File::InMemory->new(name => 'ppport.h', content => $content);
	$self->add_file($file);
	return;
}

1;



=pod

=head1 NAME

Dist::Zilla::Plugin::PPPort - PPPort for Dist::Zilla

=head1 VERSION

version 0.001

=head1 SYNOPSIS

In your dist.ini

 [PPPort]

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

