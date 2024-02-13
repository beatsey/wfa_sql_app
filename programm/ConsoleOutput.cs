using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace programm
{
    public partial class ConsoleOutput : Form
    {
        public ConsoleOutput(StringWriter StringWriterConsoleOut)
        {
            InitializeComponent();

            // Запускаем бесконечный цикл, который выводит в себя всё содержимое консоли
            Thread thread1 = new Thread(() => {
                while (!IsDisposed) {
                    textBoxConsoleOutput.Text = StringWriterConsoleOut.ToString();
                    Thread.Sleep(100);
                }
            });
            thread1.Start();
        }
    }
}
