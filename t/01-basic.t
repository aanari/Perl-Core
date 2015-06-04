use Test::Modern;
use Perl::Core '5.14';

my $match = 5 |in| [10];
ok !$match, '|in| excluded successfully';
$match = 5 |in| [5,10];
ok $match, '|in| included successfully';

try {
    ok 5, '"try" executed successfully';
    print 1/0;
} catch($err) {
    ok $err, '"try" executed successfully';
} finally {
    ok 1, '"finally" executed successfully';
}

my $name = 'Bob';
my $age;

my $person = {
    maybe name => $name,
    maybe age  => $age,
};
cmp_deeply $person => {
    name => $name,
}, '"maybe" executed successfully';

define PI = 3.14;
is PI() => 3.14, '"define" executed successfully';

done_testing;
