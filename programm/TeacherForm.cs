using Npgsql;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Common;
using System.Drawing;
using System.Linq;
using System.Reflection;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace programm
{
    public partial class TeacherForm : Form
    {
        private DataRow user;

        public TeacherForm(DataRow user)
        {
            this.user = user;
            InitializeComponent();
            Text += " (" + user["name"].ToString() + " " + user["lastname"].ToString() + ")";
            dataGridView_hw_all.DataError += dgv_DataError;
            dataGridView_hw_nomark.DataError += dgv_DataError;
            dataGridView_hw_all.CellValidating += dgv_CellValidating;
            dataGridView_hw_nomark.CellValidating += dgv_CellValidating;
        }

        private void dgv_CellValidating(object sender, DataGridViewCellValidatingEventArgs e)
        {
            // (DataGridView) sender
            DataGridView dgv = (DataGridView)sender;
            if (dgv.Columns["mark"].Index == e.ColumnIndex)
            {
                int newValue = -1;
                bool result = int.TryParse(e.FormattedValue.ToString(), out newValue);
                if (result)
                {
                    if (newValue < 0 || newValue > 5)
                    {
                        e.Cancel = true;
                        return;
                    }
                    if (dgv[e.ColumnIndex, e.RowIndex].Value is DBNull || (int)dgv[e.ColumnIndex, e.RowIndex].Value != newValue)
                    {
                        //Console.WriteLine($"UPDATE homework_user SET mark={newValue} WHERE id = {dataGridView_hw_all.Rows[e.RowIndex].Cells["id"].Value}");
                        List<NpgsqlParameter> parameters = new List<NpgsqlParameter> {
                            new NpgsqlParameter("@id", NpgsqlTypes.NpgsqlDbType.Integer) { Value = dgv.Rows[e.RowIndex].Cells["id"].Value },
                            new NpgsqlParameter("@mark", NpgsqlTypes.NpgsqlDbType.Integer) { Value = newValue }
                        };
                        dbconnect.SQLCOMMAND("UPDATE homework_user SET mark=@mark WHERE id = @id", parameters);
                    }
                }
                else if (e.FormattedValue.ToString() == "" && !(dgv[e.ColumnIndex, e.RowIndex].Value is DBNull))
                {
                    //Console.WriteLine($"UPDATE homework_user SET mark=null WHERE id = {dataGridView_hw_all.Rows[e.RowIndex].Cells["id"].Value}");
                    List<NpgsqlParameter> parameters = new List<NpgsqlParameter> {
                        new NpgsqlParameter("@id", NpgsqlTypes.NpgsqlDbType.Integer) { Value = dgv.Rows[e.RowIndex].Cells["id"].Value }
                    };
                    dbconnect.SQLCOMMAND("UPDATE homework_user SET mark=null WHERE id = @id", parameters);
                }
            }
        }

        private void dgv_DataError(object sender, DataGridViewDataErrorEventArgs e)
        {
            e.ThrowException = false;
        }

        private void tabPage_hw_nomark_Enter(object sender, EventArgs e)
        {
            List<NpgsqlParameter> parameters = new List<NpgsqlParameter> {
                new NpgsqlParameter("@teacher_id", NpgsqlTypes.NpgsqlDbType.Integer) { Value = user["user_id"] }
            };
            DataTable resultTable = dbconnect.SQLCOMMAND(@"
                    select
                    hu.id,
                    u.name,
                    u.lastname,
                    h.description as hw_description,
                    s.description as course_description,
                    hu.answer, hu.mark
                    from studygroup as sg
                    inner join study as s on sg.study_id = s.study_id
                    inner join homework as h on h.study_id = s.study_id
                    inner join studygroup_user su on sg.studygroup_id = su.studygroup_id
                    inner join users as u on u.User_id = su.User_id
                    inner join homework_user as hu on hu.homework_id = h.homework_id and u.user_id = hu.user_id
                    where sg.user_id = @teacher_id and hu.mark is null", parameters);
            foreach (DataColumn col in resultTable.Columns)
                col.ReadOnly = (col.ColumnName != "mark");

            dataGridView_hw_nomark.DataSource = resultTable;
            dataGridView_hw_nomark.Columns["id"].Visible = false;
            dataGridView_hw_nomark.Columns[dataGridView_hw_nomark.Columns.Count - 1].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dataGridView_hw_nomark.Columns[dataGridView_hw_nomark.Columns.Count - 1].FillWeight = 1;
            dataGridView_hw_nomark.Columns[dataGridView_hw_nomark.Columns.Count - 1].MinimumWidth = 100;
            dataGridView_hw_nomark.Columns["mark"].HeaderCell.Style.Font = new Font(dataGridView_hw_nomark.Font, FontStyle.Bold);
        }

        private void tabPage_hw_all_Enter(object sender, EventArgs e)
        {
            List<NpgsqlParameter> parameters = new List<NpgsqlParameter> {
                    new NpgsqlParameter("@teacher_id", NpgsqlTypes.NpgsqlDbType.Integer) { Value = user["user_id"] }
                };

            DataTable resultTable = dbconnect.SQLCOMMAND(@"
                    select
                    hu.id,
                    u.name,
                    u.lastname,
                    h.description as hw_description,
                    s.description as course_description,
                    hu.answer, hu.mark
                    from studygroup as sg
                    inner join study as s on sg.study_id = s.study_id
                    inner join homework as h on h.study_id = s.study_id
                    inner join studygroup_user su on sg.studygroup_id = su.studygroup_id
                    inner join users as u on u.User_id = su.User_id
                    inner join homework_user as hu on hu.homework_id = h.homework_id and u.user_id = hu.user_id
                    where sg.user_id = @teacher_id", parameters);
            foreach (DataColumn col in resultTable.Columns)
                col.ReadOnly = (col.ColumnName != "mark");

            dataGridView_hw_all.DataSource = resultTable;
            dataGridView_hw_all.Columns["id"].Visible = false;
            dataGridView_hw_all.Columns[dataGridView_hw_all.Columns.Count - 1].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dataGridView_hw_all.Columns[dataGridView_hw_all.Columns.Count - 1].FillWeight = 1;
            dataGridView_hw_all.Columns[dataGridView_hw_all.Columns.Count - 1].MinimumWidth = 100;
            dataGridView_hw_all.Columns["mark"].HeaderCell.Style.Font = new Font(dataGridView_hw_all.Font, FontStyle.Bold);
        }

        private void loadGroups()
        {
            
            List<NpgsqlParameter> parameters = new List<NpgsqlParameter> {
                new NpgsqlParameter("@teacher_id", NpgsqlTypes.NpgsqlDbType.Integer) { Value = user["user_id"] }
            };
            DataTable resultTable = dbconnect.SQLCOMMAND(@"
                    select
                    studygroup_id as groupID,
                    CONCAT(users.name, ' ', users.lastname) as instructor,
                    kol_students(s.studygroup_id) as number_of_students,
                    description as course_description,
                    full_description
                    from studygroup s
                    inner join study s2 using (study_id)
                    left join users on users.user_id = s.user_id
                    where s.user_id = @teacher_id or s.user_id is null
                    order by CONCAT(users.name, ' ', users.lastname) desc, studygroup_id asc", parameters);
            foreach (DataColumn col in resultTable.Columns)
                col.ReadOnly = true;

            dataGridViewGroups.DataSource = resultTable;
            dataGridViewGroups.Columns[dataGridViewGroups.Columns.Count - 1].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            dataGridViewGroups.Columns[dataGridViewGroups.Columns.Count - 1].FillWeight = 1;
            dataGridViewGroups.Columns[dataGridViewGroups.Columns.Count - 1].MinimumWidth = 100;
        }
        private void tabPageGroups_Enter(object sender, EventArgs e)
        {
            loadGroups();
        }

        private void buttonsEnabler()
        {
            //DataGridViewRow selectedRow = dataGridViewGroups.CurrentRow;

            if (dataGridViewGroups.SelectedRows.Count == 0)
            {
                buttOtkaz.Enabled = false;
                buttPrinyat.Enabled = false;
                buttViewGroup.Enabled = false;
            }
            else
            {
                buttViewGroup.Enabled = true;
                buttPrinyat.Enabled = (string)dataGridViewGroups.SelectedRows[0].Cells["instructor"].Value == " ";
                buttOtkaz.Enabled = !buttPrinyat.Enabled;
            }
        }
        private void dataGridViewGroups_SelectionChanged(object sender, EventArgs e)
        {
            buttonsEnabler();
        }

        private void buttOtkaz_Click(object sender, EventArgs e)
        {
            if (dataGridViewGroups.SelectedRows.Count == 0) return;

            int studygroup_id = (int)dataGridViewGroups.SelectedRows[0].Cells["groupid"].Value;
            List<NpgsqlParameter> parameters = new List<NpgsqlParameter> {
                        new NpgsqlParameter("@studygroup_id", NpgsqlTypes.NpgsqlDbType.Integer) { Value = studygroup_id},
                        new NpgsqlParameter("@teacher_id", NpgsqlTypes.NpgsqlDbType.Integer) { Value = user["user_id"] }
                    };
            dbconnect.SQLCOMMAND("call otkaz_ot_group(@studygroup_id, @teacher_id)", parameters);
            loadGroups();
            foreach(DataGridViewRow row in dataGridViewGroups.Rows) {
                if (!(row.Cells["groupid"].Value is DBNull) && (int)row.Cells["groupid"].Value == studygroup_id) {
                    row.Selected = true;
                    break;
                }
            }
            buttonsEnabler();
        }

        private void buttPrinyat_Click(object sender, EventArgs e)
        {
            if (dataGridViewGroups.SelectedRows.Count == 0) return;
            int studygroup_id = (int)dataGridViewGroups.SelectedRows[0].Cells["groupid"].Value;
            List<NpgsqlParameter> parameters = new List<NpgsqlParameter> {
                        new NpgsqlParameter("@studygroup_id", NpgsqlTypes.NpgsqlDbType.Integer) { Value = studygroup_id},
                        new NpgsqlParameter("@teacher_id", NpgsqlTypes.NpgsqlDbType.Integer) { Value = user["user_id"] }
                    };
            dbconnect.SQLCOMMAND("call vsyat_group(@studygroup_id, @teacher_id)", parameters);
            loadGroups();
            foreach (DataGridViewRow row in dataGridViewGroups.Rows)
            {
                if (!(row.Cells["groupid"].Value is DBNull) && (int)row.Cells["groupid"].Value == studygroup_id)
                {
                    row.Selected = true;
                    break;
                }
            }
            buttonsEnabler();
        }

        private void buttViewGroup_Click(object sender, EventArgs e)
        {
            if (dataGridViewGroups.SelectedRows.Count == 0) return;
            int studygroup_id = (int)dataGridViewGroups.SelectedRows[0].Cells["groupid"].Value;

            TeacherViewGroupList form = new TeacherViewGroupList(studygroup_id);
            form.Text = $"Cписок группы №{studygroup_id}";
            form.ShowDialog(this);
        }
    }
}
