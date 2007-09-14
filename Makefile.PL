use strict;
use warnings;
use inc::Module::Install;

name('WebService-Pathtraq-API-NormalizeURL');
author('Toru Yamaguchi <zigorou@cpan.org>');
all_from('lib/WebService/Pathtraq/API/NormalizeURL.pm');
license('perl');

requires('Carp::Clan');
requires('Class::Accessor::Fast');
requires('WWW::REST');

use_test_base;

auto_include;
auto_install;

WriteAll;
