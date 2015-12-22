#include "letters.h"

letters::letters(cppcms::service &srv) : cppcms::application(srv)
{
    dispatcher().assign("",&letters::all,this);
    mapper().assign("");

    dispatcher().assign("/capital",&letters::capital,this);
    mapper().assign("capital","/capital");

    dispatcher().assign("/small",&letters::small,this);
    mapper().assign("small","/small");
}

void letters::all()
{
    response().out()
        << "<a href='" << url("/")       << "'>Top</a><br>"
        << "<a href='" << url("/numbers")<< "'>Numbers</a><br>"
        << "<a href='" << url(".")       << "'>All Letters</a><br>"
        << "<a href='" << url("capital") << "'>Capital Letters</a><br>"
        << "<a href='" << url("small")   << "'>Small Letters</a><br>"
        << "Aa, Bb, Cc, Dd,...";
}

void letters::capital()
{
    response().out() << "A,B,C,D,...";
}

void letters::small()
{
    response().out() << "a,b,c,d,...";
}