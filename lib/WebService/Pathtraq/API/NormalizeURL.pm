package WebService::Pathtraq::API::NormalizeURL;

use strict;
use warnings;

use base qw(Class::Accessor::Fast);

__PACKAGE__->mk_accessors(qw/rest result/);

use Carp::Clan qw(croak);
use WWW::REST;

our $API_URI = "http://api.pathtraq.com/normalize_url";

=head1 NAME

WebService::Pathtraq::API::NormalizeURL - Normalize URL using Pathtraq API.

=head1 VERSION

version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

  use WebService::Pathtraq::API::NormalizeURL;

  my $url = "http://www.amazon.com/Bowflex-SelectTech-552-Dumbbell-Stand/dp/B000BH7CAI/ref=sr_1_2/104-2096515-2611145?ie=UTF8&s=sporting-goods&qid=1189760632&sr=1-2"; ### Very complex url.
  my $service = WebService::Pathtraq::API::NormalizeURL->new;
  if ($service->normalize($url)) {
    print $service->result; ### http://www.amazon.com/gp/product/B000BH7CAI
  }

=head1 DESCRIPTION

=head2 WHAT is Pathtraq?

Pathtraq(L<http://pathtraq.com/>) is a service on which people share their accessed-URL histories. The result statistics includes what webpages are "hot" now.
Pathtraq gathers access logs from joined panels and generates the statistics of popular/hot webpages, 
i.e. Alexa-like traffic info-system but more granular than domain but each page. 

=head1 METHODS

=head2 new()

Constructor.

=cut

sub new {
    my $class = shift;

    my $rest = WWW::REST->new($API_URI);
    my $self =  $class->SUPER::new({ 
        rest => $rest,
        result => ''
    });

    $self->rest->dispatch($self->text_dispatcher);

    return $self;
}

=head2 normalize($url)

Normalize URL usging API of  L<http://pathtraq.com/>.
Return value is boolean which api request was suceeded.

After request succeed, get normalize url using result() method.

=cut

sub normalize {
    my ($self, $url) = @_;

    return $self->rest->get( url => $url );
}

=head2 result()

Return latest normalized url.

=head2 text_dispatcher()

Dispatcher for text output.

=cut

sub text_dispatcher {
    my $self = shift;

    return sub {
        my $rest = shift;

        croak($rest->status_line) if ($rest->is_error);
        $self->result($rest->content);

        return $self->result ? 1 : 0;
    };
}

=head1 SEE ALSO

=over 4

=item L<WWW::REST>

=item L<http://pathtraq.com/>

=back

=head1 AUTHOR

Toru Yamaguchi, C<< <zigorou@cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to
C<bug-webservice-pathtraq-api-normalizeurl@rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org>.  I will be notified, and then you'll automatically be
notified of progress on your bug as I make changes.

=head1 COPYRIGHT & LICENSE

Copyright 2007 Toru Yamaguchi, All Rights Reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1; # End of WebService::Pathtraq::API::NormalizeURL

__END__


