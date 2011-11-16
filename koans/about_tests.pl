use strict;
use warnings;

subtest "'ok' assert function" => sub {
    subtest "is used for testing of truthfulness" => sub {
        plan tests => 1;  # I hate this

        ok(1); # 1 means true in Perl
    };

    subtest "you can pass test name as second parameter" => sub {
        plan tests => 1;

        ok(1, "This should be true -- Please fix this"); # FIXME
    };

    subtest "any non-zero number is also true" => sub {
        plan tests => 1;

        ok(-1);
    };
};

subtest "'is' assert function" => sub {
    subtest "is used to assert equality of two scalars" => sub {
        plan tests => 1;

        my $expected_value = 2; # FIXME: replace __ with correct value
        my $actual_value = 1 + 1;

        is($actual_value, $expected_value);
    };
};
