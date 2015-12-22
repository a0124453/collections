#include <cppcms/application.h>
#include <cppcms/http_response.h>
#include <cppcms/url_dispatcher.h>
#include <cppcms/url_mapper.h>
#include <iostream>

class numbers : public cppcms::application {
public:
	numbers(cppcms::service &srv) : cppcms::application(srv);
	void prime();
	void odd();
	void even();
	void all();
};
