package Dezi::MultiTenant::Config;
use strict;
use warnings;
use Carp;
use Dezi::Config;
use Plack::Util::Accessor qw(
    configs
);

our $VERSION = '0.001';

sub new {
    my $class = shift;
    my $config = shift or croak "config hashref required";
    if ( !ref $config or ref $config ne 'HASH' ) {
        croak "config should be a hashref";
    }

    my %configs;
    for my $key ( keys %$config ) {
        $configs{$key} = Dezi::Config->new( $config->{$key} );
    }

    return bless { configs => \%configs }, $class;
}

sub paths {
    my $self = shift;
    return keys %{ $self->configs };
}

sub config_for {
    my $self = shift;
    my $path = shift or croak "path required";
    return $self->{configs}->{$path};
}

1;

__END__

=head1 AUTHOR

Peter Karman, C<< <karman at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-dezi-multitenant at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Dezi-MultiTenant>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Dezi::MultiTenant


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Dezi-MultiTenant>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Dezi-MultiTenant>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Dezi-MultiTenant>

=item * Search CPAN

L<http://search.cpan.org/dist/Dezi-MultiTenant/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 COPYRIGHT & LICENSE

Copyright 2013 Peter Karman.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

