package lib::shell {

    use Exporter qw(import);
    use strict;
    use warnings;

    our @EXPORT_OK = qw(cli);

    sub cli {
        my ($command,$dummy) = @_;

        my $app = `$command`;
        $app =~ s/[0-9]//g;
        return "$app";
    }
}