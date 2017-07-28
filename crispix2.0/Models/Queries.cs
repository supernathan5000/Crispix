﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using static crispix2._0.Infrastructure.Utilities;

namespace crispix2._0.Models
{
    public static class Queries
    {
        public static List<Grid.GridRow> CreateGrid(string week)
        {
            string connectionString = ConfigurationManager.AppSettings["ConnectionString"];

            using (OleDbConnection conn = new OleDbConnection(connectionString))
            {
                var query = "SELECT PLAYERS.PLAYER, W & '-' & L as record, G1, G2, G3, G4, G5, G6, G7, G8, G9, G10 FROM PLAYERS INNER JOIN Pix ON (Week = " + week + " AND PLAYERS.PLAYER = Pix.Player)";

                var command = new OleDbCommand(query, conn);
                conn.Open();
                var reader = command.ExecuteReader();
                var results = new List<Grid.GridRow>();
                while (reader.Read())
                {
                    var username = reader.GetString(0);
                    var record = reader.GetString(1);
                    var pix = new string[10];
                    for (int i = 0; i < 10; i++)
                    {
                        pix[i] = reader.GetString(i+2);
                    }

                    results.Add(new Grid.GridRow(username, record, pix));
                }

                return results;
            }
        }

        public static List<string> GetWeekNames()
        {
            string connectionString = ConfigurationManager.AppSettings["ConnectionString"];

            using (OleDbConnection conn = new OleDbConnection(connectionString))
            {
                var query = "SELECT WeekName FROM GAMES ORDER BY WEEK Asc";

                var command = new OleDbCommand(query, conn);
                conn.Open();

                var reader = command.ExecuteReader();
                var results = new List<string>();
                
                while (reader.Read())
                {
                    results.Add(reader.GetString(0));
                }

                return results;
            }
        }

        public static List<Standings.StandingsRow> GetStandingsList()
        {
            string connectionString = ConfigurationManager.AppSettings["ConnectionString"];

            using (OleDbConnection conn = new OleDbConnection(connectionString))
            {
                var query = "SELECT PLAYERS.PLAYER, Paid, W & '-' & L, W1 & '-' & L1, W2 & '-' & L2, W3 & '-' & L3, W4 & '-' & L4, W5 & '-' & L5, W6 & '-' & L6 , " +
                                                    "W7 & '-' & L7, W8 & '-' & L8, W9 & '-' & L9, W10 & '-' & L10, W11 & '-' & L11, W12 & '-' & L12, W13 & '-' & L13, " +
                                                    "W14 & '-' & L14, W15 & '-' & L15 " +
                             "FROM PLAYERS ORDER BY W DESC";
                var command = new OleDbCommand(query, conn);
                conn.Open();
                var reader = command.ExecuteReader();
                var results = new List<Standings.StandingsRow>();
                while (reader.Read())
                {
                    var username = reader.GetString(0);

                    //true if the user has paid, false otherwise
                    var paid = reader.GetString(1).Equals("Y") ? true : false;
                    var record = reader.GetString(2);
                    var weeklyRecords = new string[15];
                    for (int i = 0; i < 15; i++)
                    {
                        weeklyRecords[i] = reader.GetString(i + 3);
                    }

                    results.Add(new Standings.StandingsRow(username, record, weeklyRecords, paid));
                }

                return results;
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