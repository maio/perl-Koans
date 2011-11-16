#!/usr/bin/env perl

use Test::More;
use Test::Builder;
use Carp;
use strict;
use warnings;

sub __ {
    local $Test::Builder::Level += 2;
    fail("please fill in value");
}

# from Test::Most
use Test::Builder;
my $OK_FUNC;
BEGIN {
    $OK_FUNC = \&Test::Builder::ok;
}

sub set_failure_handler {
    my $action = shift;
    no warnings 'redefine';
    Test::Builder->new->{TEST_MOST_failure_action} = $action; # for DESTROY
    *Test::Builder::ok = sub {
        local $Test::Builder::Level = $Test::Builder::Level + 1;
        my $builder = $_[0];
        if ( $builder->{TEST_MOST_test_failed} ) {
            $builder->{TEST_MOST_test_failed} = 0;
            $action->($builder);
        }
        $builder->{TEST_MOST_test_failed} = 0;
        my $result = $OK_FUNC->(@_);
        $builder->{TEST_MOST_test_failed} = !( $builder->summary )[-1];
        return $result;
    };
}

set_failure_handler( sub { Test::More::BAIL_OUT("Test failed.  BAIL OUT!.\n") }
);

require 'about_tests.pl';
require 'about_lists.pl';

done_testing();
