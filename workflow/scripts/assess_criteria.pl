use strict;
use warnings;
use BCDM::ORM;
use BCDM::Criteria;
use Getopt::Long;
use Log::Log4perl qw(:easy);

# Process command line arguments
my $db_file; # where to access database file
my $log_level = 'INFO'; # verbosity level for logger
my @criteria; # criteria to assess
GetOptions(
    'db=s'       => \$db_file,
    'log=s'      => \$log_level,
    'criteria=s' => \@criteria,
);

# Initialize Log::Log4perl
Log::Log4perl->init(\<<"END");
  log4perl.rootLogger = $log_level, Screen
  log4perl.appender.Screen = Log::Log4perl::Appender::Screen
  log4perl.appender.Screen.stderr = 0
  log4perl.appender.Screen.layout = Log::Log4perl::Layout::SimpleLayout
END

# Instantiate logger
my $log = Log::Log4perl->get_logger('assess_criteria');
$log->info("Going to assess criteria: @criteria");

# Connect to the database. Because there is a column `order` in the BCDM, we need to
# escape this. In SQLite that's with double quotes.
$log->info("Going to connect to database $db_file");
my $schema = BCDM::ORM->connect("dbi:SQLite:$db_file", "", "", { quote_char => '"' });

# Iterate over all BOLD records
my $rs = $schema->resultset('Bold')->search({});
while (my $record = $rs->next) {
    $log->info("Processing record ".$record->recordid) unless $record->recordid % 10_000;
    map { BCDM::Criteria->assess( $record, $_ ) } @criteria;
}