# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

######################### We start with some black magic to print on failure.

# Change 1..1 below to 1..last_test_to_print .
# (It may become useful if the test is moved to ./t subdirectory.)

BEGIN { $| = 1; print "1..6\n"; }
END {print "not ok 1\n" unless $loaded;}
use TK::RadiobuttonGroup;
$loaded = 1;
print "ok 1\n";

######################### End of black magic.

# Insert your test code below (better if it prints "ok 13"
# (correspondingly "not ok 13") depending on the success of chunk 13
# of the test code):

my($top) = MainWindow->new();
my @selected = qw(two four);
my $var = 'three';
my $radiobuttongroup = $top->RadiobuttonGroup (
	-list => [qw( one two three four five )],
	-orientation => 'vertical',
	-variable => \$var,
	-command => sub {
		print @selected, "\n";
	}
)->pack();
$top->update();
print "ok 2\n";
sleep(1);
$radiobuttongroup->configure(
	-list => [[two => 2,three => 3,four => 4,five => 5,six => 6,seven => 7]],
	-orientation => 'horizontal',
);
$top->update();
print "ok 3\n";
sleep(1);
my $var = 5;
$radiobuttongroup->configure(
	-variable => \$var,
);
$top->update();
print "ok 4\n";
sleep(1);
$radiobuttongroup->configure(
	-font => 24
);
$top->update();
print "ok 5\n";
sleep(1);
$top->destroy();
print "ok 6\n";


