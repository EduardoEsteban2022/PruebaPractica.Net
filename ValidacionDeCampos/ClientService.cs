using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ValidacionDeCampos
{
    public class ClientService
    {
        /*create a database connection*/
        string cs = ConfigurationManager.ConnectionStrings["Pass"].ConnectionString;


        /*Method that returns a customer dataset*/
        public DataSet getDatasetRow()
        {

            DataSet dt = new DataSet();

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from cliente", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                return dt;
            }

        }


        /*Method that creates a client and returns numbers of rows*/
        public int getRowsCreate(string firstName, string lastName)
        {

            int numberRows;

            using (SqlConnection con = new SqlConnection(cs))
            {

                con.Open();
                SqlCommand com = new SqlCommand("SP_insertarCliente", con);
                com.CommandType = CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@nombre", firstName);
                com.Parameters.AddWithValue("@apellido", lastName);
                numberRows = com.ExecuteNonQuery();

            }

            return numberRows;

        }

        /*Method that updates a client and returns numbers of rows*/
        public int getRowsUpdate(int clientCode, string firstName, string lastName)
        {
            int numberRows;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand com = new SqlCommand("SP_ActualizarCliente", con);
                com.CommandType = CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@cod_cliente", clientCode);
                com.Parameters.AddWithValue("@nombre", firstName);
                com.Parameters.AddWithValue("@apellido", lastName);
                numberRows = com.ExecuteNonQuery();

            }
            return numberRows;

        }


        /*Method that returns number of rows for select*/
        public int getNumbersRows()
        {

            DataSet dt = new DataSet();
            int i = 0;

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from cliente", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);

                da.Fill(dt);
                i = dt.Tables[0].Rows.Count;

                return i;
            }
        }







    }
}