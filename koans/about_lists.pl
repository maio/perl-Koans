use strict;
use warnings;

subtest "lists" => sub {
    subtest "are used to store multiple things" => sub {
        plan tests => 2;

        # list can hold numbers for example
        my @my_list = (1, 2);

        is($my_list[0], 1);
        is($my_list[1], 2); # what's second item in my_list? FIXME __
    };

    subtest "you can find out how many items are in list" => sub {
        plan tests => 1;

        my @items = (1, 2, 3);

        is(scalar @items, 3);
    };

    subtest "you can join lists" => sub {
        plan tests => 5;

        my @first = (1, 2);
        my @second = (3, 4);
        my @final = (@first, @second);

        is(scalar @final, 4, 'length should be 4 now');
        is($final[0], 1);
        is($final[1], 2);
        is($final[2], 3);
        is($final[3], 4);
    };

    subtest "you can query items from end of list" => sub {
        plan tests => 2;

        my @items = (1, 2);

        is($items[-1], 2);
        is($items[-2], 1);
    };

    subtest "you can assign list items to scalars" => sub {
        plan tests => 2;

        my @items = (1, 2);

        my ($first, $second) = @items;

        is($first, 1);
        is($second, 2);
    };

    subtest "you can use range to create list of numbers" => sub {
        plan tests => 3;

        my @items = (1..3);

        is($items[0], 1);
        is($items[1], 2);
        is($items[2], 3);
    };

    subtest "you can get list with reversed order of items" => sub {
        plan tests => 2;

        my @list = (1, 2);
        my @reversed_list = reverse @list;

        is($reversed_list[0], 2);
        is($reversed_list[1], 1);
    };

    subtest "you can slice list" => sub {
        plan tests => 2;

        my @items = (1, 2, 3);

        my ($second, $third) = @items[1..2];
        is($second, 2);
        is($third, 3);
    };

    subtest "you can pop values from the end of list" => sub {
        plan tests => 3;

        my @list = (1, 2);

        is(pop @list, 2);
        is(pop @list, 1);
        is(pop @list, undef);
    };

    subtest "you can push values into list" => sub {
        plan tests => 2;

        my @list = ();
        push @list, 1;
        push @list, 2;

        is($list[0], 1);
        is($list[1], 2);
    };

    subtest "you can join list items into one string" => sub {
        plan tests => 1;

        my @list = (1, 2, 3);

        my $result = join('-', @list);
        is($result, '1-2-3');
    };
};
