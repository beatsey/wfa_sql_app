namespace programm
{
    partial class StudentForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            this.label_teacher_fio = new System.Windows.Forms.Label();
            this.labelGroupNumber = new System.Windows.Forms.Label();
            this.labelCourseTitle = new System.Windows.Forms.Label();
            this.labelCourseDescription = new System.Windows.Forms.Label();
            this.tabControl1 = new System.Windows.Forms.TabControl();
            this.tabPageGeneral = new System.Windows.Forms.TabPage();
            this.tabPageHomework = new System.Windows.Forms.TabPage();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.tabControl1.SuspendLayout();
            this.tabPageGeneral.SuspendLayout();
            this.tabPageHomework.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // label_teacher_fio
            // 
            this.label_teacher_fio.Dock = System.Windows.Forms.DockStyle.Top;
            this.label_teacher_fio.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.label_teacher_fio.Location = new System.Drawing.Point(3, 51);
            this.label_teacher_fio.Name = "label_teacher_fio";
            this.label_teacher_fio.Size = new System.Drawing.Size(1125, 61);
            this.label_teacher_fio.TabIndex = 0;
            this.label_teacher_fio.Text = "ФИО Преподавателя:";
            // 
            // labelGroupNumber
            // 
            this.labelGroupNumber.Dock = System.Windows.Forms.DockStyle.Top;
            this.labelGroupNumber.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.labelGroupNumber.Location = new System.Drawing.Point(3, 3);
            this.labelGroupNumber.Name = "labelGroupNumber";
            this.labelGroupNumber.Size = new System.Drawing.Size(1125, 48);
            this.labelGroupNumber.TabIndex = 1;
            this.labelGroupNumber.Text = "Номер учебной группы:";
            // 
            // labelCourseTitle
            // 
            this.labelCourseTitle.Dock = System.Windows.Forms.DockStyle.Top;
            this.labelCourseTitle.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.labelCourseTitle.Location = new System.Drawing.Point(3, 112);
            this.labelCourseTitle.Name = "labelCourseTitle";
            this.labelCourseTitle.Size = new System.Drawing.Size(1125, 64);
            this.labelCourseTitle.TabIndex = 2;
            this.labelCourseTitle.Text = "Название курса:";
            // 
            // labelCourseDescription
            // 
            this.labelCourseDescription.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.labelCourseDescription.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.labelCourseDescription.Location = new System.Drawing.Point(3, 176);
            this.labelCourseDescription.Name = "labelCourseDescription";
            this.labelCourseDescription.Size = new System.Drawing.Size(1128, 366);
            this.labelCourseDescription.TabIndex = 3;
            this.labelCourseDescription.Text = "Описание курса:";
            // 
            // tabControl1
            // 
            this.tabControl1.Controls.Add(this.tabPageGeneral);
            this.tabControl1.Controls.Add(this.tabPageHomework);
            this.tabControl1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tabControl1.Location = new System.Drawing.Point(0, 0);
            this.tabControl1.Name = "tabControl1";
            this.tabControl1.Padding = new System.Drawing.Point(10, 10);
            this.tabControl1.SelectedIndex = 0;
            this.tabControl1.Size = new System.Drawing.Size(1139, 582);
            this.tabControl1.TabIndex = 1;
            // 
            // tabPageGeneral
            // 
            this.tabPageGeneral.Controls.Add(this.labelCourseDescription);
            this.tabPageGeneral.Controls.Add(this.labelCourseTitle);
            this.tabPageGeneral.Controls.Add(this.label_teacher_fio);
            this.tabPageGeneral.Controls.Add(this.labelGroupNumber);
            this.tabPageGeneral.Location = new System.Drawing.Point(4, 36);
            this.tabPageGeneral.Name = "tabPageGeneral";
            this.tabPageGeneral.Padding = new System.Windows.Forms.Padding(3);
            this.tabPageGeneral.Size = new System.Drawing.Size(1131, 542);
            this.tabPageGeneral.TabIndex = 0;
            this.tabPageGeneral.Text = "Общая информация";
            this.tabPageGeneral.UseVisualStyleBackColor = true;
            this.tabPageGeneral.Enter += new System.EventHandler(this.tabPageGeneral_Enter);
            // 
            // tabPageHomework
            // 
            this.tabPageHomework.Controls.Add(this.dataGridView1);
            this.tabPageHomework.Location = new System.Drawing.Point(4, 36);
            this.tabPageHomework.Name = "tabPageHomework";
            this.tabPageHomework.Padding = new System.Windows.Forms.Padding(3);
            this.tabPageHomework.Size = new System.Drawing.Size(1131, 542);
            this.tabPageHomework.TabIndex = 1;
            this.tabPageHomework.Text = "Домашняя работа";
            this.tabPageHomework.UseVisualStyleBackColor = true;
            this.tabPageHomework.Enter += new System.EventHandler(this.tabPageHomework_Enter);
            // 
            // dataGridView1
            // 
            this.dataGridView1.AllowUserToAddRows = false;
            this.dataGridView1.AllowUserToDeleteRows = false;
            this.dataGridView1.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.AllCells;
            this.dataGridView1.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.AllCells;
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle1.BackColor = System.Drawing.SystemColors.Window;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            dataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.ControlText;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dataGridView1.DefaultCellStyle = dataGridViewCellStyle1;
            this.dataGridView1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dataGridView1.Location = new System.Drawing.Point(3, 3);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.Size = new System.Drawing.Size(1125, 536);
            this.dataGridView1.TabIndex = 0;
            this.dataGridView1.CellValidating += new System.Windows.Forms.DataGridViewCellValidatingEventHandler(this.dataGridView1_CellValidating);
            // 
            // StudentForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1708, 873);
            this.Controls.Add(this.tabControl1);
            this.Name = "StudentForm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
            this.Text = "Окно студента";
            this.tabControl1.ResumeLayout(false);
            this.tabPageGeneral.ResumeLayout(false);
            this.tabPageHomework.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion
        private System.Windows.Forms.Label label_teacher_fio;
        private System.Windows.Forms.Label labelCourseDescription;
        private System.Windows.Forms.Label labelCourseTitle;
        private System.Windows.Forms.Label labelGroupNumber;
        private System.Windows.Forms.TabControl tabControl1;
        private System.Windows.Forms.TabPage tabPageGeneral;
        private System.Windows.Forms.TabPage tabPageHomework;
        private System.Windows.Forms.DataGridView dataGridView1;
    }
}