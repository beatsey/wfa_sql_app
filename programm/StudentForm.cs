using Npgsql;
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
    public partial class StudentForm : Form
    {
        private DataRow user;
        public StudentForm(DataRow user)
        {
            this.user = user;
            InitializeComponent();
            Text += " (" + user["name"].ToString() + " " + user["lastname"].ToString() + ")";
        }

        private void tabPageGeneral_Enter(object sender, EventArgs e)
        {
            List<NpgsqlParameter> parameters = new List<NpgsqlParameter> {
                new NpgsqlParameter("@student_id", NpgsqlTypes.NpgsqlDbType.Integer) { Value = user["user_id"] }
            };
            DataTable resultTable = dbconnect.SQLCOMMAND(@"
                select
                concat(users.""name"", ' ', lastname) as fio,
                studygroup_id,
                description,
                full_description
                from studygroup_user as su
                inner join studygroup sg using (studygroup_id)
                left join users on sg.user_id = users.user_id 
                inner join study using(study_id)
                where su.user_id = @student_id", parameters);

            if (resultTable.Rows.Count > 0)
            {
                label_teacher_fio.Text = "ФИО Преподавателя:\n" + resultTable.Rows[0]["fio"];
                labelGroupNumber.Text = "Номер учебной группы:\n" + resultTable.Rows[0]["studygroup_id"];
                labelCourseTitle.Text = "Название курса:\n" + resultTable.Rows[0]["description"];
                labelCourseDescription.Text = "Описание курса:\n" + resultTable.Rows[0]["full_description"];
            }
        }

        private void tabPageHomework_Enter(object sender, EventArgs e)
        {
            List<NpgsqlParameter> parameters = new List<NpgsqlParameter> {
                new NpgsqlParameter("@student_id", NpgsqlTypes.NpgsqlDbType.Integer) { Value = user["user_id"] }
            };
            DataTable resultTable = dbconnect.SQLCOMMAND(@"
                select
                id,
                answer,
                mark,
                description,
                theory
                from homework_user
                inner join homework using (homework_id)
                where user_id = @student_id
                order by id", parameters);
            foreach (DataColumn col in resultTable.Columns)
                col.ReadOnly = (col.ColumnName != "answer");
            dataGridView1.DataSource = resultTable;
            dataGridView1.Columns["id"].Visible = false;
            dataGridView1.Columns[dataGridView1.Columns.Count - 1].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dataGridView1.Columns[dataGridView1.Columns.Count - 1].FillWeight = 1;
            dataGridView1.Columns[dataGridView1.Columns.Count - 1].MinimumWidth = 100;
            dataGridView1.Columns["answer"].HeaderCell.Style.Font = new Font(dataGridView1.Font, FontStyle.Bold);
        }

        private void dataGridView1_CellValidating(object sender, DataGridViewCellValidatingEventArgs e)
        {
            DataGridView dgv = (DataGridView)sender;
            if (dgv.Columns["answer"].Index == e.ColumnIndex)
            {
                //Console.WriteLine($"{e.RowIndex} {e.ColumnIndex} {dgv[e.ColumnIndex, e.RowIndex].Value}");

                if (dgv[e.ColumnIndex, e.RowIndex].Value.ToString() != e.FormattedValue.ToString())
                {
                    //Console.WriteLine($"UPDATE homework_user SET answer={dgv[e.ColumnIndex, e.RowIndex].Value} WHERE id = {dgv.Rows[e.RowIndex].Cells["id"].Value}");
                    List<NpgsqlParameter> parameters = new List<NpgsqlParameter> {
                        new NpgsqlParameter("@id", NpgsqlTypes.NpgsqlDbType.Integer) { Value = dgv.Rows[e.RowIndex].Cells["id"].Value },
                        new NpgsqlParameter("@answer", NpgsqlTypes.NpgsqlDbType.Varchar) { Value = e.FormattedValue }
                    };
                    dbconnect.SQLCOMMAND("UPDATE homework_user SET answer=@answer WHERE id = @id", parameters);
                }
            }
        }
    }
}
