using Npgsql;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace programm
{
    public partial class TeacherViewGroupList : Form
    {
        public TeacherViewGroupList(int studygroup_id)
        {
            InitializeComponent();

            List<NpgsqlParameter> parameters = new List<NpgsqlParameter> {
                new NpgsqlParameter("@studygroup_id", NpgsqlTypes.NpgsqlDbType.Integer) { Value = studygroup_id }
            };
            DataTable resultTable = dbconnect.SQLCOMMAND("select * from view_marks(@studygroup_id)", parameters);
            foreach (DataColumn col in resultTable.Columns)
                col.ReadOnly = true;

            dataGridView1.DataSource = resultTable;
            dataGridView1.Columns[dataGridView1.Columns.Count - 1].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dataGridView1.Columns[dataGridView1.Columns.Count - 1].FillWeight = 1;
            dataGridView1.Columns[dataGridView1.Columns.Count - 1].MinimumWidth = 100;
        }
    }
}
