package BCDM::Criteria::SEQ_QUALITY;
use strict;
use warnings;
use base 'BCDM::Criteria';

# this so that we know the criterionid for
# updates in the intersection table
sub _criterion { $BCDM::Criteria::SEQ_QUALITY }

# this tests the criterion and returns
# boolean 0/1 depending on fail/pass. In
# addition, optional notes may be returned.
# Here, the criterion to assess is:
# 'Sequence is long, with few ambiguities'
# This will involve aligning each sequence
# against an HMM (such as the one from
# FinPROTAX), trimming the ends outside the
# 658 bp range, then trimming the gap chars
# and ambiguities, and reporting the 
# remainder (notes?) and summarizing that
# as pass/fail.
sub _assess {
    my $package = shift;
    my $record = shift;
    # TODO: implement!
    return 0, undef;
}

1;