#!/usr/bin/perl

use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../lib";

use DateTime;
use Encode;

use NonameTV::Augmenter;
use NonameTV::Factory qw/CreateDataStore/;

my $ds = CreateDataStore( );

my $dt = DateTime->now( time_zone => 'UTC' );
$dt->add( days => 7 );

my $batchid = 'neo.zdf.de_' . $dt->week_year() . '-' . $dt->week();
printf( "augmenting %s...\n", $batchid );

my $augmenter = NonameTV::Augmenter->new( $ds );

$augmenter->AugmentBatch( $batchid );
