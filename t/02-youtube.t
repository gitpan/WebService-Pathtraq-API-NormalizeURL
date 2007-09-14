use Test::More tests => 3;
use WebService::Pathtraq::API::NormalizeURL;

my $service = WebService::Pathtraq::API::NormalizeURL->new;

ok($service);
ok($service->normalize("http://www.youtube.com/watch?v=0oFOLpSd15Q&mode=related&search="));
is($service->result, "http://www.youtube.com/watch?v=0oFOLpSd15Q");
