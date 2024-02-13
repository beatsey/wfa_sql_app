namespace programm
{
    partial class TeacherForm
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle7 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle8 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle9 = new System.Windows.Forms.DataGridViewCellStyle();
            this.dataGridView_hw_nomark = new System.Windows.Forms.DataGridView();
            this.tabControl = new System.Windows.Forms.TabControl();
            this.tabPage_hw_all = new System.Windows.Forms.TabPage();
            this.dataGridView_hw_all = new System.Windows.Forms.DataGridView();
            this.tabPage_hw_nomark = new System.Windows.Forms.TabPage();
            this.tabPageGroups = new System.Windows.Forms.TabPage();
            this.dataGridViewGroups = new System.Windows.Forms.DataGridView();
            this.buttPrinyat = new System.Windows.Forms.Button();
            this.buttOtkaz = new System.Windows.Forms.Button();
            this.buttViewGroup = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView_hw_nomark)).BeginInit();
            this.tabControl.SuspendLayout();
            this.tabPage_hw_all.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView_hw_all)).BeginInit();
            this.tabPage_hw_nomark.SuspendLayout();
            this.tabPageGroups.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewGroups)).BeginInit();
            this.SuspendLayout();
            // 
            // dataGridView_hw_nomark
            // 
            this.dataGridView_hw_nomark.AllowUserToAddRows = false;
            this.dataGridView_hw_nomark.AllowUserToDeleteRows = false;
            this.dataGridView_hw_nomark.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.AllCells;
            this.dataGridView_hw_nomark.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.AllCells;
            this.dataGridView_hw_nomark.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataGridViewCellStyle7.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle7.BackColor = System.Drawing.SystemColors.Window;
            dataGridViewCellStyle7.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            dataGridViewCellStyle7.ForeColor = System.Drawing.SystemColors.ControlText;
            dataGridViewCellStyle7.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle7.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle7.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dataGridView_hw_nomark.DefaultCellStyle = dataGridViewCellStyle7;
            this.dataGridView_hw_nomark.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dataGridView_hw_nomark.Location = new System.Drawing.Point(3, 3);
            this.dataGridView_hw_nomark.Name = "dataGridView_hw_nomark";
            this.dataGridView_hw_nomark.Size = new System.Drawing.Size(960, 479);
            this.dataGridView_hw_nomark.TabIndex = 0;
            // 
            // tabControl
            // 
            this.tabControl.Controls.Add(this.tabPage_hw_all);
            this.tabControl.Controls.Add(this.tabPage_hw_nomark);
            this.tabControl.Controls.Add(this.tabPageGroups);
            this.tabControl.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tabControl.Location = new System.Drawing.Point(0, 0);
            this.tabControl.Name = "tabControl";
            this.tabControl.Padding = new System.Drawing.Point(10, 10);
            this.tabControl.SelectedIndex = 0;
            this.tabControl.Size = new System.Drawing.Size(974, 525);
            this.tabControl.TabIndex = 2;
            // 
            // tabPage_hw_all
            // 
            this.tabPage_hw_all.Controls.Add(this.dataGridView_hw_all);
            this.tabPage_hw_all.Location = new System.Drawing.Point(4, 36);
            this.tabPage_hw_all.Name = "tabPage_hw_all";
            this.tabPage_hw_all.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage_hw_all.Size = new System.Drawing.Size(966, 485);
            this.tabPage_hw_all.TabIndex = 1;
            this.tabPage_hw_all.Text = "Все работы";
            this.tabPage_hw_all.UseVisualStyleBackColor = true;
            this.tabPage_hw_all.Enter += new System.EventHandler(this.tabPage_hw_all_Enter);
            // 
            // dataGridView_hw_all
            // 
            this.dataGridView_hw_all.AllowUserToAddRows = false;
            this.dataGridView_hw_all.AllowUserToDeleteRows = false;
            this.dataGridView_hw_all.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.AllCells;
            this.dataGridView_hw_all.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.AllCells;
            this.dataGridView_hw_all.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataGridViewCellStyle8.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle8.BackColor = System.Drawing.SystemColors.Window;
            dataGridViewCellStyle8.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            dataGridViewCellStyle8.ForeColor = System.Drawing.SystemColors.ControlText;
            dataGridViewCellStyle8.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle8.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle8.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dataGridView_hw_all.DefaultCellStyle = dataGridViewCellStyle8;
            this.dataGridView_hw_all.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dataGridView_hw_all.Location = new System.Drawing.Point(3, 3);
            this.dataGridView_hw_all.Name = "dataGridView_hw_all";
            this.dataGridView_hw_all.Size = new System.Drawing.Size(960, 479);
            this.dataGridView_hw_all.TabIndex = 1;
            // 
            // tabPage_hw_nomark
            // 
            this.tabPage_hw_nomark.Controls.Add(this.dataGridView_hw_nomark);
            this.tabPage_hw_nomark.Location = new System.Drawing.Point(4, 36);
            this.tabPage_hw_nomark.Name = "tabPage_hw_nomark";
            this.tabPage_hw_nomark.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage_hw_nomark.Size = new System.Drawing.Size(966, 485);
            this.tabPage_hw_nomark.TabIndex = 0;
            this.tabPage_hw_nomark.Text = "Работы без оценки";
            this.tabPage_hw_nomark.UseVisualStyleBackColor = true;
            this.tabPage_hw_nomark.Enter += new System.EventHandler(this.tabPage_hw_nomark_Enter);
            // 
            // tabPageGroups
            // 
            this.tabPageGroups.Controls.Add(this.buttViewGroup);
            this.tabPageGroups.Controls.Add(this.buttOtkaz);
            this.tabPageGroups.Controls.Add(this.buttPrinyat);
            this.tabPageGroups.Controls.Add(this.dataGridViewGroups);
            this.tabPageGroups.Location = new System.Drawing.Point(4, 36);
            this.tabPageGroups.Name = "tabPageGroups";
            this.tabPageGroups.Padding = new System.Windows.Forms.Padding(3);
            this.tabPageGroups.Size = new System.Drawing.Size(966, 485);
            this.tabPageGroups.TabIndex = 2;
            this.tabPageGroups.Text = "Мои группы";
            this.tabPageGroups.UseVisualStyleBackColor = true;
            this.tabPageGroups.Enter += new System.EventHandler(this.tabPageGroups_Enter);
            // 
            // dataGridViewGroups
            // 
            this.dataGridViewGroups.AllowUserToAddRows = false;
            this.dataGridViewGroups.AllowUserToDeleteRows = false;
            this.dataGridViewGroups.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dataGridViewGroups.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.AllCells;
            this.dataGridViewGroups.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.AllCells;
            this.dataGridViewGroups.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataGridViewCellStyle9.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle9.BackColor = System.Drawing.SystemColors.Window;
            dataGridViewCellStyle9.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            dataGridViewCellStyle9.ForeColor = System.Drawing.SystemColors.ControlText;
            dataGridViewCellStyle9.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle9.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle9.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dataGridViewGroups.DefaultCellStyle = dataGridViewCellStyle9;
            this.dataGridViewGroups.Location = new System.Drawing.Point(0, 0);
            this.dataGridViewGroups.MultiSelect = false;
            this.dataGridViewGroups.Name = "dataGridViewGroups";
            this.dataGridViewGroups.ReadOnly = true;
            this.dataGridViewGroups.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dataGridViewGroups.Size = new System.Drawing.Size(966, 441);
            this.dataGridViewGroups.TabIndex = 0;
            this.dataGridViewGroups.SelectionChanged += new System.EventHandler(this.dataGridViewGroups_SelectionChanged);
            // 
            // buttPrinyat
            // 
            this.buttPrinyat.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.buttPrinyat.Enabled = false;
            this.buttPrinyat.Location = new System.Drawing.Point(759, 447);
            this.buttPrinyat.Name = "buttPrinyat";
            this.buttPrinyat.Size = new System.Drawing.Size(201, 30);
            this.buttPrinyat.TabIndex = 1;
            this.buttPrinyat.Text = "Принять выделенную группу";
            this.buttPrinyat.UseVisualStyleBackColor = true;
            this.buttPrinyat.Click += new System.EventHandler(this.buttPrinyat_Click);
            // 
            // buttOtkaz
            // 
            this.buttOtkaz.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.buttOtkaz.Enabled = false;
            this.buttOtkaz.Location = new System.Drawing.Point(532, 447);
            this.buttOtkaz.Name = "buttOtkaz";
            this.buttOtkaz.Size = new System.Drawing.Size(221, 30);
            this.buttOtkaz.TabIndex = 2;
            this.buttOtkaz.Text = "Отказаться от выделенной группы";
            this.buttOtkaz.UseVisualStyleBackColor = true;
            this.buttOtkaz.Click += new System.EventHandler(this.buttOtkaz_Click);
            // 
            // buttViewGroup
            // 
            this.buttViewGroup.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.buttViewGroup.Enabled = false;
            this.buttViewGroup.Location = new System.Drawing.Point(342, 447);
            this.buttViewGroup.Name = "buttViewGroup";
            this.buttViewGroup.Size = new System.Drawing.Size(184, 30);
            this.buttViewGroup.TabIndex = 3;
            this.buttViewGroup.Text = "Открыть список группы";
            this.buttViewGroup.UseVisualStyleBackColor = true;
            this.buttViewGroup.Click += new System.EventHandler(this.buttViewGroup_Click);
            // 
            // TeacherForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(974, 525);
            this.Controls.Add(this.tabControl);
            this.Name = "TeacherForm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
            this.Text = "Окно преподавателя";
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView_hw_nomark)).EndInit();
            this.tabControl.ResumeLayout(false);
            this.tabPage_hw_all.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView_hw_all)).EndInit();
            this.tabPage_hw_nomark.ResumeLayout(false);
            this.tabPageGroups.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewGroups)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridView_hw_nomark;
        private System.Windows.Forms.TabControl tabControl;
        private System.Windows.Forms.TabPage tabPage_hw_nomark;
        private System.Windows.Forms.TabPage tabPage_hw_all;
        private System.Windows.Forms.DataGridView dataGridView_hw_all;
        private System.Windows.Forms.TabPage tabPageGroups;
        private System.Windows.Forms.DataGridView dataGridViewGroups;
        private System.Windows.Forms.Button buttOtkaz;
        private System.Windows.Forms.Button buttPrinyat;
        private System.Windows.Forms.Button buttViewGroup;
    }
}