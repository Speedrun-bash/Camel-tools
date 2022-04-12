termux:
	cpan App::cpanminus
	cpan LWP::UserAgent
	cpan Term::ReadKey
	cpan Term::ReadLine::Gnu
	cpan Term::UI
	cpan Term::UI::History
	cpan Term::UI::History::Gnu
	cpan Term::UI::History::Perl
	cpanm $(cat cpanfile)

ubuntu:
	cpan LWP::UserAgent
	cpan HTTP::Request
	cpanm $(cat cpanfile)
