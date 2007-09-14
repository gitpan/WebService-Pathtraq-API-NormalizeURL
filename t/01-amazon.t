use Test::More tests => 3;
use WebService::Pathtraq::API::NormalizeURL;

my $service = WebService::Pathtraq::API::NormalizeURL->new;

ok($service);
ok($service->normalize("http://www.amazon.com/Bowflex-SelectTech-552-Dumbbell-Stand/dp/B000BH7CAI/ref=sr_1_2/104-2096515-2611145?ie=UTF8&s=sporting-goods&qid=1189760632&sr=1-2"));
is($service->result, "http://www.amazon.com/gp/product/B000BH7CAI");
