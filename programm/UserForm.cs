using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Reflection;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace programm
{
    public partial class UserForm : Form
    {
        public UserForm(DataRow user)
        {
            InitializeComponent();
            Text += " (" + user["name"].ToString() + " " + user["lastname"].ToString() + ")";

            DataTable resultTable = dbconnect.SQLCOMMAND("SELECT * FROM view_courses()");
            dataGridView1.DataSource = resultTable;
            dataGridView1.Columns[dataGridView1.Columns.Count - 1].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dataGridView1.Columns[dataGridView1.Columns.Count - 1].FillWeight = 1;

        }
    }
}
