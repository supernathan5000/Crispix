using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using static crispix2._0.Infrastructure.Utilities;


/// <summary>
/// This class contains all of the queries that will be used on/with the database
/// 
/// It uses OleDb connections to connect to an Access database
/// 
/// From, for all intents and purposes, a first time OleDb user, here's some insight into its wonderful world
/// 
/// To execute a query, you need to create a command using that query and an OleDb Connection
/// To see the results of that query, you need to create a reader to read the results of command.ExecuteReader()
/// 
/// There are a handful of ways to use that reader, but I've found one that works and chose to stick with it
/// To use the reader, it's best to use it in a where(reader.Read()) loop, so that so long as there's something to be read it will continue to process it
/// I believe each iteration of the where loop processes another row of the query results
/// To access the first column, you would do reader.GetString(0)
/// 
/// There's more that could be explained, but I think what's here (plus all the code below) will save an unfamiliar user some time googling
/// </summary>



namespace crispix2._0.Models
{
    public static class Queries
    {
        /// <summary>
        /// Returns a list of GridRow objects used to display the Pix grid
        /// </summary>
        /// <param name="week">A string representing which week number to show the grid for</param>
        /// <returns></returns>
        public static List<Grid.GridRow> CreateGrid(string week)
        {
            //Get the database connection string from the web.config file
            string connectionString = ConfigurationManager.AppSettings["ConnectionString"];

            using (OleDbConnection conn = new OleDbConnection(connectionString))
            {
                //Create the query that will be executed
                var query = "SELECT PLAYERS.PLAYER, W & '-' & L as record, G1, G2, G3, G4, G5, G6, G7, G8, G9, G10 FROM PLAYERS INNER JOIN Pix ON (Week = " + week + " AND PLAYERS.PLAYER = Pix.Player)";

                //create the olebd command object and open the connection
                var command = new OleDbCommand(query, conn);
                conn.Open();

                //create the results reader
                var reader = command.ExecuteReader();

                //create the list of GridRows to return
                var results = new List<Grid.GridRow>();

                //while the reader has a row to process
                while (reader.Read())
                {
                    //get the value of the first column
                    var username = reader.GetString(0);

                    //get the value of the second column
                    var record = reader.GetString(1);

                    //create a string to hold the pix associated with the username
                    var pix = new string[10];

                    //loop through the remaining columns, adding the values to the pix array
                    for (int i = 0; i < 10; i++)
                    {
                        pix[i] = reader.GetString(i+2);
                    }

                    //add the the list of Gridrows a new row for this user
                    results.Add(new Grid.GridRow(username, record, pix));
                }

                //close the connection and return the results
                conn.Close();
                return results;
            }
        }

        /// <summary>
        /// Returns a List of strings containing the names to the weeks (Sep 3, for example)
        /// </summary>
        /// <returns></returns>
        public static List<string> GetWeekNames()
        {
            //Get the database connection string from the web.config file
            string connectionString = ConfigurationManager.AppSettings["ConnectionString"];

            using (OleDbConnection conn = new OleDbConnection(connectionString))
            {
                //Create the query to be executed
                var query = "SELECT WeekName FROM GAMES ORDER BY WEEK Asc";

                //Create a db command using the query and the connection and then open the connection to the db
                var command = new OleDbCommand(query, conn);
                conn.Open();

                //Create a reader to read the results of the query
                var reader = command.ExecuteReader();

                //Create a list of strings to return to the method caller
                var results = new List<string>();
                
                //While there are rows to process
                while (reader.Read())
                {
                    //Add the column value to the results list
                    results.Add(reader.GetString(0));
                }

                //Close the connection and return the results
                conn.Close();
                return results;
            }
        }

        /// <summary>
        /// Returns a list of StandingsRow objects used to show the current standings
        /// </summary>
        /// <returns></returns>
        public static List<Standings.StandingsRow> GetStandingsList()
        {
            //Get the database connection string from the web.config file
            string connectionString = ConfigurationManager.AppSettings["ConnectionString"];

            using (OleDbConnection conn = new OleDbConnection(connectionString))
            {
                //Create the query to be executed
                var query = "SELECT PLAYERS.PLAYER, Paid, W & '-' & L, W1 & '-' & L1, W2 & '-' & L2, W3 & '-' & L3, W4 & '-' & L4, W5 & '-' & L5, W6 & '-' & L6 , " +
                                                    "W7 & '-' & L7, W8 & '-' & L8, W9 & '-' & L9, W10 & '-' & L10, W11 & '-' & L11, W12 & '-' & L12, W13 & '-' & L13, " +
                                                    "W14 & '-' & L14, W15 & '-' & L15 " +
                             "FROM PLAYERS ORDER BY W DESC";

                //Create the db command using the query and the connection and open the connection
                var command = new OleDbCommand(query, conn);
                conn.Open();

                //Create a reader to process the results
                var reader = command.ExecuteReader();

                //Create a list of StandingsRow objects to return to the user
                var results = new List<Standings.StandingsRow>();

                //Where there are rows left to process
                while (reader.Read())
                {
                    //Set the username from the first column of the row
                    var username = reader.GetString(0);

                    //Get whether or not this user has paid
                    //true if the user has paid, false otherwise
                    var paid = reader.GetString(1).Equals("Y") ? true : false;

                    //Get this user's overall record
                    var record = reader.GetString(2);

                    //Create an array to hold this user's pix for each week
                    var weeklyRecords = new string[15];

                    //Loop over the remaining columns and add them to the array of pix
                    for (int i = 0; i < 15; i++)
                    {
                        weeklyRecords[i] = reader.GetString(i + 3);
                    }

                    //Create a new StandingsRow object and add it to the list
                    results.Add(new Standings.StandingsRow(username, record, weeklyRecords, paid));
                }

                //Close the connection and return the results
                conn.Close();
                return results;
            }
        }

        public static List<Schedule.ScheduleWeek> GetSchedule()
        {
            //Get the database connection string from the web.config file
            string connectionString = ConfigurationManager.AppSettings["ConnectionString"];

            using (OleDbConnection conn = new OleDbConnection(connectionString))
            {
                var query = 
            }
        }


        /// <summary>
        /// Executes a select query to retrieve data from the given table
        /// </summary>
        /// <param name="columns">What to select from the </param>
        /// <param name="tableName">The table to select data from</param>
        /// <param name="whereClause">Optional WHERE clause for the query</param>
        /// <param name="orderBy">Optional ORDER BY clause for the query</param>
        /// <returns></returns>
        //public static List<string> SelectQuery(string tableName, string[] columns, string whereClause = "", string orderBy = "")
        //{


            //command.ExecuteNonQuery()

            //var query = dbConnection.CreateCommand();

            //var temp = new OleDbParameter()

            ////add the columns to the query
            //query.CommandText = "SELECT ";
            //var colCount = columns.Length;
            //foreach (var col in columns)
            //{
            //    query.CommandText += "? ";

            //    query.Parameters.Add( col.ToString());
            //    colCount--;
            //    if (colCount != 0)
            //    {
            //        query.CommandText += ",";
            //    }
            //}

            ////add the value(s) to the query
            //query.CommandText += "FROM ? ? ";
            //query.Parameters.Add(tableName);
            //query.Parameters.Add(whereClause);

            //if (!whereClause.Equals(""))
            //{
            //    query.CommandText += "?";
            //    query.Parameters.Add(orderBy);
            //}

            //dbConnection.Open();
            //var result = query.ExecuteNonQuery();
            //dbConnection.Close();

            //return result;
        //}

        /// <summary>
        /// Inserts the values into the given table
        /// </summary>
        /// <param name="tableName">The name of the table to insert into</param>
        /// <param name="columns">The columns to insert data into</param>
        /// <param name="values">The values to be inserted</param>
        /// <returns>Returns the number of rows affected or -2 if there's an error</returns>
        public static int InsertQuery(string tableName, string[] columns, string[] values)
        {
            if (columns.Length != values.Length)
            {
                return -2;
            }
            string connectionString = ConfigurationManager.AppSettings["ConnectionString"];

            using (OleDbConnection dbConnection = new OleDbConnection(connectionString))
            {
                var query = dbConnection.CreateCommand();

                //add the table name to the query
                query.CommandText = "INSERT INTO ? ";
                query.Parameters.Add(tableName);

                //add the column name(s) to the query
                query.CommandText += "(";
                var colCount = columns.Length;
                foreach (var col in columns)
                {
                    query.CommandText += "? ";
                    query.Parameters.Add(col.ToString());
                    if (colCount > 0)
                    {
                        query.CommandText += ", ";
                    }
                }
                query.CommandText += ") ";

                //add the value(s) to the query
                query.CommandText += "VALUES (";
                colCount = values.Length;
                foreach (string val in values)
                {
                    query.CommandText += "? ";
                    query.Parameters.Add(val.ToString());
                    if (colCount > 0)
                    {
                        query.CommandText += ", ";
                    }
                }
                query.CommandText += ")";

                dbConnection.Open();
                var result = query.ExecuteNonQuery();
                dbConnection.Close();

                return result;
            }
        }

        /// <summary>
        /// Updates the table with the information provided
        /// </summary>
        /// <param name="tableName">The name of the table to update</param>
        /// <param name="columns">Each of the columns to be updated</param>
        /// <param name="values">The new values to be set</param>
        /// <param name="whereClause">Optional where clause for the query</param>
        /// <returns>Returns the number of rows affected or -2 if there's an error</returns>
        public static int UpdateQuery(string tableName, string[] columns, string[] values, string whereClause = "")
        {
            if (columns.Length != values.Length)
            {
                return -2;
            }

            string connectionString = ConfigurationManager.AppSettings["ConnectionString"];

            using (OleDbConnection dbConnection = new OleDbConnection(connectionString))
            {
                var query = dbConnection.CreateCommand();
                query.CommandText = "UPDATE ";
                query.Parameters.Add(tableName);

                query.CommandText = "SET ";
                var colCount = columns.Length;
                for (int i = 0; i < columns.Length; i++)
                {
                    query.CommandText += "? = ?";
                    query.Parameters.Add(columns[i].ToString());
                    query.Parameters.Add(values[i].ToString());
                    colCount--;
                    if (colCount > 0)
                    {
                        query.CommandText += ", ";
                    }
                }

                dbConnection.Open();
                var result = query.ExecuteNonQuery();
                dbConnection.Close();

                return result;
            }
        }
    }
}