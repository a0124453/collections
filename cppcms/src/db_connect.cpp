#include <my_global.h>
#include <mysql.h>
#include <iostream>

using namespace std;

int main(int argc, char **argv)
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

  execute_query(con, "use entry_db;".c_str());
  execute_query(con, "insert into users(nickname) values(test3);".c_str());

  mysql_close(con);

  return 0;
}

void execute_query(MYSQL *con, char *query)
{
    if (mysql_query(con, query))
    {
        finish_with_error(con);
    }
}

void finish_with_error(MYSQL *con)
{
    cout << mysql_error(con) << endl;
    mysql_close(con);
    exit(1);
}
