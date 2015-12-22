#include <my_global.h>
#include <mysql.h>
#include <iostream>
#include <string>

using namespace std;

void finish_with_error(MYSQL *con)
{
    cout << "Connection Error: " << mysql_error(con) << endl;
    mysql_close(con);
    exit(1);
}

void execute_query(MYSQL *con, char *query)
{
    if (mysql_query(con, query))
    {
        finish_with_error(con);
    }
}

MYSQL *connect_to_mysql()
{
    MYSQL *con = mysql_init(NULL);
    if (con == NULL)
    {
        cout << mysql_error(con) << endl;
        exit(1);
    }
    if (mysql_real_connect(con, "localhost", "", "", NULL, 0, NULL, 0) == NULL)
    {
        finish_with_error(con);
    }
    execute_query(con, "use entry_db;");
    return con;
}

void insert_user(string nickname)
{
    MYSQL *con = connect_to_mysql();

    string query = "insert into users(nickname) values('" + nickname + "');";
    execute_query(con, query.c_str());

    mysql_close(con);
}

void update_user(string username, string nickname)
{
    MYSQL *con = connect_to_mysql();

    string query = "update users set nickname = '" + nickname +
        "' where username = " + username + ";"
    execute_query(con, query.c_str());

    mysql_close(con);
}

void update_profile_pic()
{
}

int main(int argc, char **argv)
{
    insert_user("test insert");
    update_user("1", "test update");

    return 0;
}
