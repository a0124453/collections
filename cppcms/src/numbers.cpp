#include "numbers.h"

numbers::numbers(cppcms::service &srv) : cppcms::application(srv)
{
    dispatcher().assign("",&numbers::all,this);
    mapper().assign("");

    dispatcher().assign("/odd",&numbers::odd,this);
    mapper().assign("odd","/odd");

    dispatcher().assign("/even",&numbers::even,this);
    mapper().assign("even","/even");

    dispatcher().assign("/prime",&numbers::prime,this);
    mapper().assign("prime","/prime");
}

void numbers::prime()
{
    response().out() << "2,3,5,7,...";
}

void numbers::odd()
{
    response().out() << "1,3,5,7,9,...";
}

void numbers::even()
{
    response().out() << "2,4,6,8,10,...";
}

void numbers::all()
{
    response().out()
        << "<a href='" << url("/")       << "'>Top</a><br>"
        << "<a href='" << url("/letters")<< "'>Letters</a><br>"
        << "<a href='" << url(".")       << "'>All Numbers</a><br>"
        << "<a href='" << url("odd")     << "'>Odd Numbers</a><br>"
        << "<a href='" << url("even")    << "'>Even Numbers</a><br>"
        << "<a href='" << url("prime")   << "'>Prime Numbers</a><br>"
        << "1,2,3,4,5,6,7,8,9,10,...";
}
