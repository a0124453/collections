#include <cppcms/application.h>
#include <cppcms/applications_pool.h>
#include <cppcms/service.h>
#include <cppcms/http_response.h>
#include <cppcms/url_dispatcher.h>
#include <cppcms/url_mapper.h>
#include <iostream>
#include "numbers.h"
#include "letters.h"

class myapp: public cppcms::application {
public:
	myapp(cppcms::service &srv) :
        cppcms::application(srv)
	{
	    attach( new numbers(srv),
	            "numbers", "/numbers{1}", // mapping
	            "/numbers(/(.*))?", 1);   // dispatching
	    attach( new letters(srv),
	            "letters", "/letters{1}", // mapping
	            "/letters(/(.*))?", 1);   // dispatching

	    dispatcher().assign("",&myapp::describe,this);
	    mapper().assign(""); // default URL

	    mapper().root("/myapp");
	}

	void describe()
	{
	    response().out()
	        << "<a href='" << url("/numbers")<< "'>Numbers</a><br>"
	        << "<a href='" << url("/letters")<< "'>Letters</a><br>";
	}
};

int main(int argc,char ** argv)
{
    try {
        cppcms::service srv(argc,argv);
        srv.applications_pool().mount(
            cppcms::applications_factory<myapp>()
        );
        srv.run();
    }
    catch(std::exception const &e) {
        std::cerr << e.what() << std::endl;
    }

    return 0;
}
