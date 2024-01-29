package BCDM::Criteria::PUBLIC_VOUCHER;
use strict;
use warnings;
use base 'BCDM::Criteria';

# this so that we know the criterionid for
# updates in the intersection table
sub _criterion { $BCDM::Criteria::PUBLIC_VOUCHER }

# this tests the criterion and returns
# boolean 0/1 depending on fail/pass. In
# addition, optional notes may be returned.
# Here, the criterion to assess is:
# 'Specimen is vouchered in a public collection'
# This will involve substring matching against
# the thousands of different values in this 
# column. Many of them have some regularity
# to them, but there's a long tail of
# idiosyncratic entries.
sub _assess {
    my $package = shift;
    my $record = shift;
    # TODO implement me
    return 0, undef;
}

1;