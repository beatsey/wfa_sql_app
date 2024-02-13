using Npgsql;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace programm
{
    public static class dbconnect
    {
        public static DataTable SQLCOMMAND(string sql_command, List<NpgsqlParameter> parameters = null)
        {
            DataTable resultTable = new DataTable();

            // Connection string
            string connectionString = "Host=localhost;Username=postgres;Password=1234;Database=programm";

            // Create and open the database connection
            using (NpgsqlConnection connection = new NpgsqlConnection(connectionString))
            {
                try
                {
                    connection.Open();

                    // Create a command with the SQL statement and the connection
                    using (NpgsqlCommand command = new NpgsqlCommand(sql_command, connection))
                    {
                        if (parameters != null)
                        foreach (var parameter in parameters)
                            command.Parameters.Add(parameter);

                        using (NpgsqlDataReader reader = command.ExecuteReader())
                        {
                            // Load the data reader into the DataTable
                            resultTable.Load(reader);

                            // Делаем все столбцы изменяемыми
                            foreach (DataColumn column in resultTable.Columns)
                                column.ReadOnly = false;
                        }
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"Error: {ex.Message}");
                }
            }

            return resultTable;
        }
        public static DataRow getUserByLoginPassword(string login, string password)
        {
            List<NpgsqlParameter> parameters = new List<NpgsqlParameter> {
                new NpgsqlParameter("@login", NpgsqlTypes.NpgsqlDbType.Varchar) { Value = login },
                new NpgsqlParameter("@password", NpgsqlTypes.NpgsqlDbType.Varchar) { Value = password }
            };
            DataTable resultTable = SQLCOMMAND($@"
SELECT * FROM users
inner join usergroup using(usergroup_id)
where login=@login and password = @password
", parameters);

            // Успешно удалось найти нужного пользователя
            if (resultTable.Rows.Count == 1)
                return resultTable.Rows[0];

            return null;
        }
    }
}
