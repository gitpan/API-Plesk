#!/usr/bin/perl

use strict;
use warnings;

use Carp;
use Test::More;
use Data::Dumper;

use lib 't';
use TestData;

BEGIN {
    plan tests => 2;
}

BEGIN { use_ok( 'API::Plesk::Domains' ); }

is_deeply(
    API::Plesk::Domains::create(
        dname        => 'yandex.ru',
        ip           => '192.168.1.99',
        client_id    =>  12345,
        ftp_login    => 'asdasdad',
        ftp_password => 'qwertsdasy',
        template     => 'tariff1',
    ),

    '<domain><add><gen_setup><status>0</status><htype>' . 
    'vrt_hst</htype><client_id>12345</client_id><name>' .
    "yandex.ru</name><ip_address>192.168.1.99</ip_address>" .
    '</gen_setup><hosting><vrt_hst><ftp_login>asdasdad</ftp_login>' . 
    "<ftp_password>qwertsdasy</ftp_password><ip_address>192.168.1.99" . 
    "</ip_address></vrt_hst></hosting><template-name>tariff1" .
    '</template-name></add></domain>',

    'API::Plesk::Domains::create test'
);
