using Npgsql;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Common;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace programm
{
    public partial class AdminForm : Form
    {
        public AdminForm(DataRow user)
        {
            InitializeComponent();
            Text += " (" + user["name"].ToString() + " " + user["lastname"].ToString() + ")";
        }

        private string connectionString = "Host=localhost;Username=postgres;Password=1234;Database=programm";
        private NpgsqlDataAdapter dataAdapter;
        private DataTable dataTable;
        private NpgsqlCommandBuilder commandBuilder;

        private void select_users()
        {
            string query = "SELECT usergroup_id,login,password,name,lastname,date_of_birth,number FROM users";

            // Create a DataSet to hold the data
            dataTable = new DataTable();

            // Create an NpgsqlDataAdapter and pass the query and connection string
            dataAdapter = new NpgsqlDataAdapter(query, connectionString);
            commandBuilder = new NpgsqlCommandBuilder(dataAdapter);
            dataAdapter.Fill(dataTable);

            dataGridViewUSERS.DataSource = dataTable;
            dataGridViewUSERS.Columns[dataGridViewUSERS.Columns.Count - 1].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dataGridViewUSERS.Columns[dataGridViewUSERS.Columns.Count - 1].FillWeight = 1;
            dataGridViewUSERS.Columns[dataGridViewUSERS.Columns.Count - 1].MinimumWidth = 100;
        }
        private void select_USERGROUP()
        {
            string query = "SELECT * FROM usergroup";

            // Create a DataSet to hold the data
            dataTable = new DataTable();

            // Create an NpgsqlDataAdapter and pass the query and connection string
            dataAdapter = new NpgsqlDataAdapter(query, connectionString);
            commandBuilder = new NpgsqlCommandBuilder(dataAdapter);
            dataAdapter.Fill(dataTable);

            dataGridViewUSERGROUP.DataSource = dataTable;
            dataGridViewUSERGROUP.Columns[dataGridViewUSERGROUP.Columns.Count - 1].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dataGridViewUSERGROUP.Columns[dataGridViewUSERGROUP.Columns.Count - 1].FillWeight = 1;
            dataGridViewUSERGROUP.Columns[dataGridViewUSERGROUP.Columns.Count - 1].MinimumWidth = 100;
        }

        private void select_HOMEWORK()
        {
            string query = "SELECT * FROM homework";

            // Create a DataSet to hold the data
            dataTable = new DataTable();

            // Create an NpgsqlDataAdapter and pass the query and connection string
            dataAdapter = new NpgsqlDataAdapter(query, connectionString);
            commandBuilder = new NpgsqlCommandBuilder(dataAdapter);
            dataAdapter.Fill(dataTable);

            dataGridViewHW.DataSource = dataTable;
            dataGridViewHW.Columns[dataGridViewHW.Columns.Count - 1].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dataGridViewHW.Columns[dataGridViewHW.Columns.Count - 1].FillWeight = 1;
            dataGridViewHW.Columns[dataGridViewHW.Columns.Count - 1].MinimumWidth = 100;
        }
        private void select_studygroup()
        {
            string query = "SELECT * FROM studygroup";

            // Create a DataSet to hold the data
            dataTable = new DataTable();

            // Create an NpgsqlDataAdapter and pass the query and connection string
            dataAdapter = new NpgsqlDataAdapter(query, connectionString);
            commandBuilder = new NpgsqlCommandBuilder(dataAdapter);
            dataAdapter.Fill(dataTable);

            dataGridViewSTUDYGROUP.DataSource = dataTable;
            dataGridViewSTUDYGROUP.Columns[dataGridViewSTUDYGROUP.Columns.Count - 1].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dataGridViewSTUDYGROUP.Columns[dataGridViewSTUDYGROUP.Columns.Count - 1].FillWeight = 1;
            dataGridViewSTUDYGROUP.Columns[dataGridViewSTUDYGROUP.Columns.Count - 1].MinimumWidth = 100;
        }
        private void select_study()
        {
            string query = "SELECT * FROM study";

            // Create a DataSet to hold the data
            dataTable = new DataTable();

            // Create an NpgsqlDataAdapter and pass the query and connection string
            dataAdapter = new NpgsqlDataAdapter(query, connectionString);
            commandBuilder = new NpgsqlCommandBuilder(dataAdapter);
            dataAdapter.Fill(dataTable);

            dataGridViewSTUDY.DataSource = dataTable;
            dataGridViewSTUDY.Columns[dataGridViewSTUDY.Columns.Count - 1].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dataGridViewSTUDY.Columns[dataGridViewSTUDY.Columns.Count - 1].FillWeight = 1;
            dataGridViewSTUDY.Columns[dataGridViewSTUDY.Columns.Count - 1].MinimumWidth = 100;
        }
        private void select_hwuser()
        {
            string query = "SELECT * FROM homework_user";

            // Create a DataSet to hold the data
            dataTable = new DataTable();

            // Create an NpgsqlDataAdapter and pass the query and connection string
            dataAdapter = new NpgsqlDataAdapter(query, connectionString);
            commandBuilder = new NpgsqlCommandBuilder(dataAdapter);
            dataAdapter.Fill(dataTable);

            dataGridViewHWUSER.DataSource = dataTable;
            dataGridViewHWUSER.Columns[dataGridViewHWUSER.Columns.Count - 1].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dataGridViewHWUSER.Columns[dataGridViewHWUSER.Columns.Count - 1].FillWeight = 1;
            dataGridViewHWUSER.Columns[dataGridViewHWUSER.Columns.Count - 1].MinimumWidth = 100;
        }
        private void select_studygroupuser()
        {
            string query = "SELECT * FROM studygroup_user";

            // Create a DataSet to hold the data
            dataTable = new DataTable();

            // Create an NpgsqlDataAdapter and pass the query and connection string
            dataAdapter = new NpgsqlDataAdapter(query, connectionString);
            commandBuilder = new NpgsqlCommandBuilder(dataAdapter);
            dataAdapter.Fill(dataTable);

            dataGridViewSGUSER.DataSource = dataTable;
            dataGridViewSGUSER.Columns[dataGridViewSGUSER.Columns.Count - 1].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dataGridViewSGUSER.Columns[dataGridViewSGUSER.Columns.Count - 1].FillWeight = 1;
            dataGridViewSGUSER.Columns[dataGridViewSGUSER.Columns.Count - 1].MinimumWidth = 100;
        }
        // USERS
        private void tabPageUsers_Enter(object sender, EventArgs e)
        {
            select_users();
        }

        private void buttSaveUsers_Click(object sender, EventArgs e)
        {
            dataAdapter.Update(dataTable);
            select_users();
        }

        // USERGROUP
        private void tabPageUSERGROUP_Enter(object sender, EventArgs e)
        {
            select_USERGROUP();
        }
        private void buttUSERGROUP_Click(object sender, EventArgs e)
        {
            dataAdapter.Update(dataTable);
            select_USERGROUP();
        }
        // HOMEWORK
        private void tabPageHOMEWORK_Enter(object sender, EventArgs e)
        {
            select_HOMEWORK();
        }

        private void buttonHW_Click(object sender, EventArgs e)
        {
            dataAdapter.Update(dataTable);
            select_HOMEWORK();
        }
        // STUDYGROUP
        private void tabPageStudyGroup_Enter(object sender, EventArgs e)
        {
            select_studygroup();
        }
        private void buttSTUDYGROUP_Click(object sender, EventArgs e)
        {
            dataAdapter.Update(dataTable);
            select_studygroup();
        }
        // STUDY
        private void tabPageSTUDY_Enter(object sender, EventArgs e)
        {
            select_study();
        }

        private void buttonSTUDY_Click(object sender, EventArgs e)
        {
            dataAdapter.Update(dataTable);
            select_study();
        }

        // HOMEWORK_USER
        private void tabPageHWUSER_Enter(object sender, EventArgs e)
        {
            select_hwuser();
        }

        private void buttonHWUSER_Click(object sender, EventArgs e)
        {
            dataAdapter.Update(dataTable);
            select_hwuser();
        }

        // STUDYGROUP_USER
        private void tabPageSTUSER_Enter(object sender, EventArgs e)
        {
            select_studygroupuser();
        }
        private void buttonSGUSER_Click(object sender, EventArgs e)
        {
            dataAdapter.Update(dataTable);
            select_studygroupuser();
        }

    }
}
