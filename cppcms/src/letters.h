#include <cppcms/application.h>
#include <cppcms/http_response.h>
#include <cppcms/url_dispatcher.h>
#include <cppcms/url_mapper.h>
#include <iostream>

class letters : public cppcms::application {
public:
	letters(cppcms::service &srv) : cppcms::application(srv);
	void all();
	void capital();
	void small();
};
